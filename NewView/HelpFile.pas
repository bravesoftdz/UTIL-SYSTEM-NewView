Unit HelpFile;

// NewView - a new OS/2 Help Viewer
// Copyright 2003 Aaron Lawrence (aaronl at consultant dot com)
// This software is released under the Gnu Public License - see readme.txt

Interface

// Encapsulates the basic reading of a help file's structure.

uses
  Classes,
  BseDos,
  Os2Def,
  SysUtils,
  Graphics,
  IPFFileFormatUnit,
  HelpTopic,
  HelpBitmap,
  ACLUtility,
  SearchTable;

type
  THelpFile = class
  protected
    _Filename : string;
    _FileSize : longint;
    _Handle: HFILE;

    _pSlotData: pUInt16;
    _SlotDataSize: longint;

    _Title: string;

    _Topics: TList; // of TTopics

    _Dictionary: TList; // pointers to strings.

    _Index: TStringList;

    _SearchTable: TSearchTable;

    _ReferencedFiles: TStringList;

    _FontTable: TList;

    _pHeader: TPHelpFileHeader;
    _pExtendedHeader: TPExtendedHelpFileHeader;
    _pContentsData: pointer;
    _pResourceData: pointer;
    _pSearchData: pointer;
    _pHighlightWords: UInt32ArrayPointer;
    _pSlotOffsets: Uint32ArrayPointer;
    _pDictionaryData: pointer;
    _pFontTableData: pointer;
    _pTopicNameData: pointer;
    _pTopicGlobalNamesData: pointer;

    procedure InitMembers;
    procedure Open;
    procedure Close;
    procedure ReadFileBlock( Var Dest: pointer;
                             const StartPosition: ULONG;
                             const Length: ULONG );

    procedure ReadHeader;
    procedure ReadContents;
    procedure ReadDictionary;
    procedure ReadSearchTable;

    procedure ReadIndex;

    procedure ReadReferencedFilesTable;
    procedure ReadFontTableData;
    procedure ParseFontTable;

    function GetTopic( Index: longint ): TTopic;
    function GetTopicCount: longint;

    function GetDictionaryCount: longint;
    function GetDictionaryWord( Index: longint ): string;
    function GetDictionaryWordPtr( Index: longint ): pstring;

    function GetIndexEntryPtr( Index: longint ): pstring;
    function GetHighlightWords: UInt32ArrayPointer;

    function GetSearchTable: TSearchTable;

    // Lookup global or local panel name list
    function FindTopicByName( const Name: string;
                              Var pData: pointer;
                              Count: longint;
                              Offset: longint ): TTopic;

  public
    constructor Create( const FileName: string );

    destructor Destroy; override;

    function GetIndex: TStringList;

    property Title: string read _Title;
    property Topics[ Index: longint ]: TTopic read GetTopic;
    property TopicList: TList read _Topics;
    property TopicCount: longint read GetTopicCount;
    property Index: TStringList read GetIndex;
    property IndexEntryPtr[ index: longint ]: pstring read GetIndexEntryPtr;
    property Filename: string read _FileName;

    property ReferencedFiles: TStringList read _ReferencedFiles;

    procedure GetImages( ImageOffsets: TList;
                         Images: TImageList );

    function GetImage( ImageOffset: longint ): THelpBitmap;

    property DictionaryCount: longint read GetDictionaryCount;
    property DictionaryWords[ Index: longint ]: string read GetDictionaryWord;
    property DictionaryWordPtrs[ Index: longint ]: pstring read GetDictionaryWordPtr;

    function IndexOfTopic( Topic: TTopic ): longint;

    property SearchTable: TSearchTable read GetSearchTable;

    function FindTopicByResourceID( ID: uint16 ): TTopic;

    function FindTopicByLocalName( const Name: string ): TTopic;
    function FindTopicByGlobalName( const Name: string ): TTopic;

    function FindTopicByTitleStartsWith( const SearchText: string ): TTopic;
    function FindTopicByTitleContains( const SearchText: string ): TTopic;

    function FindTopicByIndexStartsWith( const SearchText: string ): TTopic;
    function FindTopicByIndexContains( const SearchText: string ): TTopic;

    procedure FindResourceIDsForTopic( Topic: TTopic;
                                       ResourceIDs: TList );

    property HighlightWords: UInt32ArrayPointer read GetHighlightWords;

    property FileSize: longint read _FileSize;

    procedure SetupFontSubstitutes( Substitutions: string );
  public
    NotesLoaded: boolean; // used externally

  end;

// Returns helpfile that the given topic is within
Function TopicFile( Topic: TTopic ): THelpFile;

function GetHelpFileTitle( const Filename: string ): string;

Implementation

uses
  BseErr,
  StringUtilsUnit,
  CharUtilsUnit,
  DebugUnit,
  ACLFileIOUtility,
  ACLLanguageUnit;

// Load "missing" bitmap
{$R Images}

var
  FileErrorNotFound: string;
  FileErrorAccessDenied: string;
  FileErrorInUse: string;
  FileErrorInvalidHeader: string;

Procedure OnLanguageEvent( Language: TLanguageFile;
                           const Apply: boolean );
begin

  Language.Prefix := 'HelpFile.';
  Language.LL( Apply, FileErrorNotFound, 'FileErrorNotFound', 'File not found' );
  Language.LL( Apply, FileErrorAccessDenied, 'FileErrorAccessDenied', 'Access denied' );
  Language.LL( Apply, FileErrorInUse, 'FileErrorInUse', 'File in use by another program' );
  Language.LL( Apply,
               FileErrorInvalidHeader,
               'FileErrorInvalidHeader',
               'File doesn''t appear to be an OS/2 Help document (header ID not correct)' );
  Language.LL( Apply,
               ErrorCorruptHelpFile,
               'ErrorCorruptHelpFile',
               'File is corrupt' );
end;

Function TopicFile( Topic: TTopic ): THelpFile;
Begin
  Result := Topic.HelpFile as THelpFile;
end;

procedure THelpFile.InitMembers;
begin
  _SlotDataSize := 0;

  _pHeader := nil;
  _pExtendedHeader := nil;
  _pContentsData := nil;
  _pSlotOffsets := nil;
  _pResourceData := nil;
  _pSearchData := nil;
  _pDictionaryData := nil;
//  _pIndexData := nil;
  _pFontTableData := nil;

  _pHighlightWords := nil;

  _Dictionary := TList.Create;
  _Topics := TList.Create;
// _Index := TStringList.Create;
  _ReferencedFiles := TStringList.Create;
  _FontTable := TList.Create;

  NotesLoaded := false;
end;

constructor THelpFile.Create( const FileName: string );
begin
  LogEvent(LogParse, 'Helpfile Load: ' + FileName);

  _FileName := FileName;

  InitMembers;

  Open;

  // we always need these basics:
  try
    ReadHeader;
    ReadContents;
    // ReadIndex;
    ReadDictionary;
    ReadFontTableData;
    ParseFontTable;
    ReadReferencedFilesTable;
  except
    Close;
    raise;
  end;

  // the rest is loaded on demand
end;

destructor THelpFile.Destroy;
begin
  DeallocateMemory( _pHeader );
  DeallocateMemory( _pExtendedHeader );
  DeallocateMemory( _pContentsData );
  DeallocateMemory( _pSlotOffsets );
  DeallocateMemory( _pResourceData );
  DeallocateMemory( _pSearchData );
  DeallocateMemory( _pDictionaryData );
//  DeallocateMemory( _pIndexData );
  DeallocateMemory( _pFontTableData );

  DeallocateMemory( _pHighlightWords );

  if Assigned( _Topics ) then
    DestroyListAndObjects( _Topics );

  if Assigned( _Index ) then
    _Index.Destroy;

  _Dictionary.Free;
  _SearchTable.Free;
  _ReferencedFiles.Free;
  _FontTable.Free;

  DosClose( _Handle );
end;

procedure THelpFile.Open;
var
  OpenAction: ULong;
  rc: APIRET;
  szName: Cstring;
  FileInfo: FILESTATUS3;
begin
  if not FileExists( _Filename ) then
    raise EHelpFileException.Create( FileErrorNotFound );

  szName := _FileName;
  rc := DosOpen( szName,
                 _Handle,
                 OpenAction,
                 0, // file size - irrelevant, not creating,
                 0, // attributes - ''
                 OPEN_ACTION_OPEN_IF_EXISTS,
                 OPEN_SHARE_DENYNONE + OPEN_ACCESS_READONLY,
                 nil ); // no extended attributes
  if rc<> 0 then
  begin
    case rc of
      ERROR_FILE_NOT_FOUND: // crap, this doesn't actually occur!
        raise EHelpFileException.Create( FileErrorNotFound );

      ERROR_ACCESS_DENIED:
        raise EHelpFileException.Create( FileErrorAccessDenied );

      ERROR_SHARING_VIOLATION:
        raise EHelpFileException.Create( FileErrorInUse );

      else
        raise EHelpFileException.Create( SysErrorMessage( rc ) );
    end;
  end;

  DosQueryFileInfo( _Handle,
                    FIL_STANDARD,
                    FileInfo,
                    sizeof( FileInfo ) );
  _FileSize := FileInfo.cbFile; // file size
end;

procedure THelpFile.Close;
begin
  if _Handle <> 0 then
    DosClose( _Handle );
  _Handle := 0;
end;

procedure THelpFile.ReadFileBlock( Var Dest: pointer;
                                   const StartPosition: ULONG;
                                   const Length: ULONG );
begin
  if not ACLFileIOUtility.ReadFileBlock( _Handle,
                                         Dest,
                                         StartPosition,
                                         Length ) then
  begin
    raise EHelpFileException.Create( ErrorCorruptHelpFile );
  end
end;

// -------------------------------------------------------------------------

procedure THelpFile.ReadHeader;
begin
  LogEvent(LogParse, 'Read header');

  ReadFileBlock( _pHeader,
                 0,
                 sizeof( _pHeader^ ) );

  if _pHeader^.ID <> INF_HEADER_ID then
  begin
    // not an OS/2 help file.
    if _pHeader^.ID = $5f3f then
      raise EWindowsHelpFormatException.Create( 'Win16' );

    raise EHelpFileException.Create( FileErrorInvalidHeader );
  end;

  _Title := StrPas( _pHeader^.Title );

  if _pHeader^.extstart > 0 then
  begin
    // read extended header
    ReadFileBlock( _pExtendedHeader,
                   _pHeader^.extstart,
                   sizeof( _pExtendedHeader^ ) );
  end;
end;

procedure THelpFile.ReadContents;
var
  Topic: TTopic;
  EntryIndex: longint;
  pEntry: pTTOCEntryStart;
  pEnd: pTTOCEntryStart;
  tmpSizeAsLongword : longword;
begin
  LogEvent(LogParse, 'Read contents');

  if _pHeader^.ntoc = 0 then
  begin
    exit; // explicit check required since ntoc is unsigned
  end;

  // Presize the topics list to save reallocation time
  _Topics.Capacity := _pHeader^.ntoc;

  // this has to be used because we multiply a longword with
  // this; otherwise the compiler generates code that
  // calculates the wrong value
  tmpSizeAsLongword := sizeof(uint32);

  // read slots first so that Topics can refer to it.
  ReadFileBlock( _pSlotOffsets,
                 _pHeader^.slotsstart,
                 _pHeader^.nslots *  tmpSizeAsLongword);

  ReadFileBlock( _pContentsData,
                 _pHeader^.tocstart,
                 _pHeader^.toclen );

  pEntry := _pContentsData;
  pEnd := _pContentsData + _pHeader^.toclen;

  for EntryIndex := 0 to _pHeader^.ntoc - 1 do
  begin
    if pEntry >= pEnd then
      // runs off end of data!
      raise EHelpFileException.Create( ErrorCorruptHelpFile );

    Topic := TTopic.Create( _Handle,
                            _pSlotOffsets,
                            _Dictionary,
                            pEntry,
                            _FontTable,
                            _ReferencedFiles );

    Topic.HelpFile := Self;
    Topic.Index := EntryIndex;

    _Topics.Add( Topic );

    inc( pEntry, pEntry ^. Length );
  end;
end;

procedure THelpFile.ReadDictionary;
var
  i: longint;
  Len: uint8;
  p: pbyte;
  pEnd: pbyte;
begin
  LogEvent(LogParse, 'Read dictionary');

  if _pHeader^.ndict = 0 then
    exit; // explicit check required since ndict is unsigned

  ReadFileBlock( _pDictionaryData,
                 _pHeader^.dictstart,
                 _pHeader^.dictlen );

  P := _pDictionaryData;
  pEnd := _pDictionaryData + _pHeader^.dictlen;

  // Presize the dictionary to save reallocation
  _Dictionary.Capacity := _pHeader^.ndict;
  for i := 0 to _pHeader^.ndict - 1 do
  begin
    // adjust length so we can use as a Pascal string
    // (file uses length including length byte,
    //  Pascal string have length excluding length byte)
    if p >= pEnd then
      // ran off end of data
      raise EHelpFileException.Create( ErrorCorruptHelpFile );

    Len := p^ - 1;
    p^ := Len;
    _Dictionary.Add( P );
    inc( P, Len + 1 );
  end;
end;

function THelpFile.GetIndex: TStringList;
begin
  if _Index = nil then
    ReadIndex;
  Result := _Index;
end;

type
  TIndexEntryHeader = record
    TextLength: uint8;
    Flags: uint8;
    NumberOfRoots: uint8;
    TOCIndex: uint16;
  end;

procedure THelpFile.ReadIndex;
var
  IndexIndex: longint; // I can't resist :-)
  pEntryHeader: ^TIndexEntryHeader;
  EntryText: string;
  IndexTitleLen: longint;
  p: pointer;
  pEnd: pointer;
  pIndexData: pointer;
begin
  LogEvent(LogParse, 'Read index');

  _Index := TStringList.Create;

  if _pHeader^.nindex = 0 then
    exit; // explicit check required since ndict is unsigned

  pIndexData := nil;
  ReadFileBlock( pIndexData,
                 _pHeader^.indexstart,
                 _pHeader^.indexlen );

  P := pIndexData;
  pEnd := pIndexData + _pHeader^.indexlen;

  for IndexIndex := 0 to _pHeader^.nindex - 1 do
  begin
    if p >= pEnd then
    begin
      // ran off end of data
      raise EHelpFileException.Create( ErrorCorruptHelpFile );
    end;

    pEntryHeader := p;
    IndexTitleLen := pEntryHeader^.TextLength;
    inc( p, sizeof( TIndexEntryHeader ) );

    GetMemString( p, EntryText, IndexTitleLen );
    if ( pEntryHeader^.flags and 2 ) > 0 then
    begin
      EntryText := '- ' + EntryText;
    end;
    if pEntryHeader^.TOCIndex < _Topics.Count then
      _Index.AddObject( EntryText, _Topics[ pEntryHeader^.TOCIndex ] )
    else
//      raise EHelpFileException.Create( 'Error reading help file index - out of range topic reference' );
      ; // pass! something special

    inc( p, IndexTitleLen
            + pEntryHeader^.NumberOfRoots
              * sizeof( uint32 ) ); // skip 'roots' for index search
  end;

  DeallocateMemory( pIndexData );
end;

function THelpFile.GetSearchTable: TSearchTable;
begin
  if _SearchTable = nil then
    ReadSearchTable;
  Result := _SearchTable;
end;

procedure THelpFile.ReadSearchTable;
var
  SearchTableOffset: longint;
  SearchTableRecordLengthIs16Bit: boolean;
begin
  LogEvent(LogParse, 'Read search table');

  if _pHeader^.SearchLen = 0 then
  begin
    LogEvent(LogParse, 'Read search table (len = 0');
    exit;
  end;

  SearchTableOffset := _pHeader^.SearchStart and $7fffffff;
  SearchTableRecordLengthIs16Bit := _pHeader^.SearchStart and $80000000 > 0;
  ReadFileBlock( _pSearchData,
                 SearchTableOffset,
                 _pHeader^.SearchLen );

  _SearchTable := TSearchTable.Create( _pSearchData,
                                       SearchTableRecordLengthIs16Bit,
                                       _Dictionary.Count,
                                       _Topics.Count );
end;

function THelpFile.GetHighlightWords: UInt32ArrayPointer;
begin
  if _pHighlightWords = nil then
    _pHighlightWords := AllocateMemory( _Dictionary.Count * sizeof( UInt32 ) );
  Result := _pHighlightWords;
end;

function THelpFile.FindTopicByResourceID( ID: uint16 ): TTopic;
var
  i: longint;
  pResourceIDs: UInt16ArrayPointer;
  pTopicIndices: UInt16ArrayPointer;
  FileResourceID: uint16;
  TopicIndex: uint16;
begin
  Result := nil;

  if _pHeader^.nres = 0 then
    // since nres is unsigned
    exit;

  if _pResourceData = nil then
    ReadFileBlock( _pResourceData,
                   _pHeader^.resstart,
                   _pHeader^.nres * sizeof( uint16 ) * 2 ); // list of IDs, list of topics

  pResourceIDs := _pResourceData;
  pTopicIndices := _pResourceData
                   + _pHeader^.nres * sizeof( uint16 );

  for i := 0 to _pHeader^.nres - 1 do
  begin
    FileResourceID := pResourceIDs^[ i ];
    if FileResourceID = ID then
    begin
      // found
      TopicIndex := pTopicIndices^[ i ];
      Result := _Topics[ TopicIndex ];
      exit;
    end;
  end;
end;

// Look up a local "panel name" and return associated topic, if any.
function THelpFile.FindTopicByLocalName( const Name: string ): TTopic;
begin
  Result := FindTopicByName( Name,
                             _pTopicNameData,
                             _pHeader^.nname,
                             _pHeader^.namestart );
end;

function THelpFile.FindTopicByGlobalName( const Name: string ): TTopic;
begin
  Result := nil;

  if _pExtendedHeader = nil then
    // no extended header - no global list to lookup
    exit;

  Result := FindTopicByName( Name,
                             _pTopicGlobalNamesData,
                             _pExtendedHeader ^. EntryInGNameTable,
                             _pExtendedHeader ^. HelpPanelGNameTblOffset );

end;

// The text of the names are stored in the (global) dictionary
// with a table referencing them.
// We could use a binary search here... but whatever...
function THelpFile.FindTopicByName( const Name: string;
                                    Var pData: pointer;
                                    Count: longint;
                                    Offset: longint ): TTopic;
var
  i: longint;
  pNameTable: UInt16ArrayPointer;
  pTopicIndices: UInt16ArrayPointer;
  TopicIndex: uint16;

  TopicNameWordIndex: uint16;
  pTopicName: pstring;
begin
  Result := nil;

  if Count = 0 then
    // since it's unsigned
    exit;

  if pData = nil then
    ReadFileBlock( pData,
                   Offset,
                   Count * sizeof( uint16 ) * 2 ); // list of name words, list of topics

  // get pointers to the two parts of the table
  pNameTable := pData;
  pTopicIndices := pData
                   + Count * sizeof( uint16 );

  for i := 0 to Count - 1 do
  begin
    TopicNameWordIndex := pNameTable[ i ];
    pTopicName := DictionaryWordPtrs[ TopicNameWordIndex ];

    if CompareText( pTopicName^, Name ) = 0 then
    begin
      // found
      TopicIndex := pTopicIndices^[ i ];
      Result := _Topics[ TopicIndex ];
      exit;
    end;
  end;
end;

function THelpFile.FindTopicByIndexStartsWith( const SearchText: string ): TTopic;
var
  i: longint;
  tmpIndex: String;
begin
  result := nil;
  GetIndex; // make sure it's read
  for i := 0 to _Index.Count - 1 do
  begin
    tmpIndex := _Index.ValuePtrs[i]^; 
    if StrStartsWithIgnoringCase(tmpIndex, SearchText) then
    begin
      // found
      result := TTopic( Index.Objects[ i ] );
      exit;
    end;
  end;
end;

function THelpFile.FindTopicByIndexContains( const SearchText: string ): TTopic;
var
  i: longint;
begin
  result := nil;
  GetIndex; // make sure it's read
  for i := 0 to _Index.Count - 1 do
  begin
    if CaseInsensitivePos( SearchText, _Index.ValuePtrs[ i ] ^ ) > 0 then
    begin
      // found
      result := TTopic( Index.Objects[ i ] );
      exit;
    end;
  end;
end;

function THelpFile.FindTopicByTitleStartsWith( const SearchText: string ): TTopic;
var
  i: longint;
  tmpTopic: TTopic;
  tmpLevel : integer;
  tmpMore : boolean;
begin
  result := nil;

  tmpLevel := 0;
  repeat
    tmpMore := false;
    inc(tmpLevel);
    for i := 0 to _Topics.Count - 1 do
    begin
      tmpTopic := _Topics[i];
      if tmpLevel = tmpTopic.ContentsLevel then
      begin
        if StrStartsWithIgnoringCase(tmpTopic.TitlePtr^, SearchText) then
        begin
          result := tmpTopic;
          exit;
        end;
      end;
      if tmpLevel < tmpTopic.ContentsLevel then
      begin
        tmpMore := True;
      end;
    end;
  until NOT tmpMore;
end;

function THelpFile.FindTopicByTitleContains( const SearchText: string ): TTopic;
var
  i: longint;
  tmpTopic: TTopic;
  tmpLevel : integer;
  tmpMore : boolean;
begin
  result := nil;

  tmpLevel := 0;
  repeat
    tmpMore := false;
    inc(tmpLevel);
    for i := 0 to _Topics.Count - 1 do
    begin
      tmpTopic := _Topics[i];
      if tmpLevel = tmpTopic.ContentsLevel then
      begin
        if CaseInsensitivePos( SearchText, tmpTopic.TitlePtr ^ ) > 0 then
        begin
          result := tmpTopic;
          exit;
        end;
      end;
      if tmpLevel < tmpTopic.ContentsLevel then
      begin
        tmpMore := True;
      end;
    end;
  until NOT tmpMore;
end;

procedure THelpFile.FindResourceIDsForTopic( Topic: TTopic;
                                             ResourceIDs: TList );
var
  i: longint;
  pResourceIDs: UInt16ArrayPointer;
  pTopicIndices: UInt16ArrayPointer;
begin
  ResourceIDs.Clear;

  if _pHeader^.nres = 0 then
    // since nres is unsigned
    exit;

  if _pResourceData = nil then
    ReadFileBlock( _pResourceData,
                   _pHeader^.resstart,
                   _pHeader^.nres * sizeof( uint16 ) * 2 ); // list of IDs, list of topics

  pResourceIDs := _pResourceData;
  pTopicIndices := _pResourceData
                   + _pHeader^.nres * sizeof( uint16 );

  for i := 0 to _pHeader^.nres - 1 do
  begin
    if pTopicIndices^[ i ] = Topic.Index then
    begin
      // found
      ResourceIDs.Add( pointer( pResourceIDs^[ i ] ) );
    end;
  end;
end;

procedure THelpFile.ReadReferencedFilesTable;
var
  i: longint;
  p: pointer;
  pData: pointer;
  DatabaseName: string;
  pLength: pByte;
begin
  if _pExtendedHeader = nil then
    // no extended header -> no referenced files table
    exit;

  if _pExtendedHeader ^.Numdatabase = 0 then
    exit;

  pData := nil; // please allocate...
  ReadFileBlock( pData,
                 _pExtendedHeader^.DatabaseOffset,
                 _pExtendedHeader^.DatabaseSize );

  p := pData;
  for i := 0 to _pExtendedHeader^.Numdatabase - 1 do
  begin
    pLength := p; // length byte, including itself
    GetMemString( p + 1, DatabaseName, ( pLength ^ ) - 1 );
    _ReferencedFiles.Add( DatabaseName );
    inc( p, pLength ^ ); // skip to next entry
  end;
  DeallocateMemory( pData );
end;

procedure THelpFile.ReadFontTableData;
begin
  if _pExtendedHeader = nil then
    // no extended header -> no font table
    exit;

  if _pExtendedHeader^.NumFontEntry = 0 then
    exit;

  ReadFileBlock( _pFontTableData,
                 _pExtendedHeader^.FontTableOffset,
                 _pExtendedHeader^.NumFontEntry * sizeof( THelpFontSpec ) );
end;

procedure THelpFile.ParseFontTable;
var
  i: longint;
  p: pointer;
  pFontSpec: pTHelpFontSpec;
begin
  _FontTable.Clear;

  p := _pFontTableData;
  if p = nil then
    exit; // no data

  for i := 0 to _pExtendedHeader^.NumFontEntry - 1 do
  begin
    pFontSpec := p + i * sizeof( THelpFontSpec );
    _FontTable.Add( pFontSpec );
  end;
end;

procedure THelpFile.GetImages( ImageOffsets: TList;
                               Images: TImageList );
var
  ListIndex: longint;
  ImageOffset: longint;
  Bitmap: THelpBitmap;
begin
  Images.Clear;

  for ListIndex := 0 to ImageOffsets.Count - 1 do
  begin
    ImageOffset := longint( ImageOffsets[ ListIndex ] );
    try
      Bitmap := THelpBitmap.CreateFromHelpFile( _Handle,
                                               _pHeader^.imgstart
                                               + ImageOffset );
    except
      on e: EHelpBitmapException do
{        raise EHelpFileException.Create( 'Error loading help bitmap at'
                                         + IntToStr( ImageOffset )
                                         + ': '
                                         + e.Message );}
      begin
        Bitmap := THelpBitmap.Create;
        Bitmap.LoadFromResourceName( 'MissingBitmap' );
      end;
    end;

    Images.Add( Bitmap, nil );
    Bitmap.Destroy;

  end;
end;

function THelpFile.GetImage( ImageOffset: longint ): THelpBitmap;
begin
  try
    Result := THelpBitmap.CreateFromHelpFile( _Handle,
                                              _pHeader^.imgstart
                                              + ImageOffset );
  except
    on e: EHelpBitmapException do
{        raise EHelpFileException.Create( 'Error loading help bitmap at'
                                       + IntToStr( ImageOffset )
                                       + ': '
                                       + e.Message );}
    begin
      result := nil;
    end;
  end;
end;

function THelpFile.GetTopic( Index: longint ): TTopic;
begin
  if    ( Index < 0 )
     or ( Index > _Topics.Count - 1 ) then
    Result := nil
  else
    Result := _Topics[ Index ];
end;

function THelpFile.GetTopicCount: longint;
begin
  Result := _Topics.Count;
end;

function THelpFile.IndexOfTopic( Topic: TTopic ): longint;
begin
  Result := _Topics.IndexOf( Topic );
end;

function THelpFile.GetDictionaryCount: longint;
begin
  Result := _Dictionary.Count;
end;

function THelpFile.GetDictionaryWord( Index: longint ): string;
begin
  Result := pstring( _Dictionary[ Index ] )^;
end;

function THelpFile.GetDictionaryWordPtr( Index: longint ): pstring;
begin
  Result := pstring( _Dictionary[ Index ] );
end;

function THelpFile.GetIndexEntryPtr( Index: longint ): pstring;
begin
  if _Index = nil then
    ReadIndex;
  Result := _Index.ValuePtrs[ Index ];
end;


// Looks for fonts that should be substitued to the
// users selected fixed font
// doesn't make a lot of sense for this to be here...
procedure THelpFile.SetupFontSubstitutes( Substitutions: string );
var
  Item: string;
  FontName: string;
  SpacePos: longint;
  W: longint;
  H: longint;
  i: longint;
  pFontSpec: pTHelpFontSpec;
  tmpSubstitutionItems : TStringList;
  tmpCounter : integer;
  tmpDimensionParts : TStringList;
begin
  ParseFontTable; // (re)load table from raw data

  tmpSubstitutionItems := TStringList.Create;
  StrExtractStrings(tmpSubstitutionItems, Substitutions, [';'], #0);

  for tmpCounter := 0 to tmpSubstitutionItems.Count - 1 do
  begin
    Item := tmpSubstitutionItems[tmpCounter];
    try
      if Item <> '' then
      begin
        // Look for space in xxxx WxH

        SpacePos := LastPosOfChar(' ', Item);
        if SpacePos > 0 then
        begin
          // fontname comes before
          FontName := StrLeft( Item, SpacePos - 1 );
          Delete( Item, 1, SpacePos );

          // width and height after, with an X between
          tmpDimensionParts := TStringList.Create;
          StrExtractStrings(tmpDimensionParts, Item, ['x'], #0);
          W := StrToInt(tmpDimensionParts[0]);
          H := StrToInt(tmpDimensionParts[1]);
          tmpDimensionParts.Destroy;
          if ( W > 0 ) and ( H > 0 ) then
          begin
            // Now look through the font table for matches
            for i := 0 to _FontTable.Count - 1 do
            begin
              pFontSpec := _FontTable[ i ];
              if StrPasWithLength( pFontSpec^.FaceName, sizeof( pFontSpec^.FaceName ) ) = FontName then
              begin
                // same face name...
                if ( W = pFontSpec ^. Height ) and ( H = pFontSpec ^. Width ) then
                begin
                  // match
                  _FontTable[ i ] := SubstituteFixedFont;
                end;
              end;
            end;
          end;
        end;
      end;
    except
    end;
  end;

  tmpSubstitutionItems.Destroy;
end;


// -------------------------------------------------------------
// Get the title only from specific help file (if possible)

function GetHelpFileTitle( const Filename: string ): string;
var
  OpenAction: ULong;
  rc: APIRET;
  szName: Cstring;

  Header: THelpFileHeader;
  Handle: HFILE;
  Ext: string;
begin
  Ext := ExtractFileExt( Filename );
  Result := '';

  if    StrEqualIgnoringCase( Ext, '.inf' )
     or StrEqualIgnoringCase( Ext, '.hlp' ) then
  begin
    szName := Filename;
    rc := DosOpen( szName,
                   Handle,
                   OpenAction,
                   0, // file size - irrelevant, not creating,
                   0, // attributes - ''
                   OPEN_ACTION_OPEN_IF_EXISTS,
                   OPEN_SHARE_DENYNONE + OPEN_ACCESS_READONLY,
                   nil ); // no extended attributes
    if rc = 0 then
    begin
      FillChar( Header, sizeof( Header ), 0 );
      if MyRead( Handle, Addr( Header ), sizeof( Header ) ) then
        if Header.ID = INF_HEADER_ID then
          Result := StrPas( Header.Title );
      DosClose( Handle );
    end;
  end;
end;

Initialization
  RegisterProcForLanguages( OnLanguageEvent );
End.

