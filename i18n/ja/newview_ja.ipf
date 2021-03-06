:userdoc.
:docprof toc=123456.
:title.NewView Help

:h1 id=0 res=30000.最初に

:p.:artwork name='img0.bmp' runin. :hp2.NewViewにようこそ！ :ehp2.
:p.
:p.NewViewはOS/2（またはeComStation）のヘルプファイルを読むためのプログラムです。&per. 
:p.:link reftype=hd refid=1.サポートとライセンス :elink.
:p.:link reftype=hd refid=2.NewViewの使い方 :elink.
:p.:hp1.あなたがヘルプファイルを指定せずにNewViewを開始した時にこのファイルが表示されるのを止めたい場合、
「ツール」→「オプション」→「一般」タブを見て下さい。 :ehp1.
:p.:hp2.改訂履歴 :ehp2.
:p.NewViewはOS/2と一緒に提供されるオリジナルのIBMのプログラムを置き換えます。
:p.NewViewは　現代的で使いやすいインターフェイス、多くのオプション、Viewが単純に
持っていなかった新しい機能の追加とViewの多くの面に改良をおこなっています。
:p.
:h2 id=1 res=1.サポートとライセンス

:p.:hp2.サポートとライセンス :ehp2.
:p.
:p.1999年〜2006年の間のNewViewの著作権はAaron Lawrenceにあります。
また、この著作権はGNU Public Licenseに基づいてライセンスされます。
これはあなたがソースコードを得る権利を持つことを意味します。

:p.2006年からRonald Brillがこの製品の開発を続けています。
.br 
NewViewは現在Netlabsのプロジェクトのひとつです。
:p.より技術的な詳細は Readme&per.txt ファイルをご覧ください。 
:p.NewViewの改訂履歴は Changes&per.txt ファイルをご覧ください。
:p.もしあなたがNewViewは有用であると思ったなら、ぜひ私にメールを送って下さい、そして／また
開発の継続を支援するために寄付をお願いします。あなたからの連絡を楽しみにしています！
:p.提案、賛辞、バグの報告は http&colon.//svn&per.netlabs&per.org/newview にお願いします。
:p.NewViewをあなたの言語に翻訳します。
:p.Netlabsへの寄付は http&colon.//www&per.mensys&per.nl からお願いします。
.br 

:p.:hp2.バグを報告するとき :ehp2.
:p.もし、あなたがクラッシュや他の問題を報告する必要があるならば、使用していたファイルが何か、
あなたがどのような操作をしていたか・・・など、可能なかぎり状況を特定して下さい。
もし可能なら newview&per.log ファイルを添付して下さい。このログファイルは
.br
−NewViewと同じディレクトリ
.br 
−環境変数 LOGFILES（eCS 1&per.1以降の機能です）で設定されたフォルダ
.br 
この二つのどちらかにあります。
.br
もし問題の生じるヘルプファイルが特定できて、それらが大きく（1MB以上）なければ、私に送って下さい。
:p.以下の情報のほとんどは newview&per.log ファイルの中に書き込まれていますが、
確認のためにあなたが調べて一緒に連絡してくれると非常に助かります。
:p.NewViewのバージョン（「ヘルプ」→「製品情報」）
:p.（使用していた）ヘルプファイルのファイル名
:p.もし問題が不正確な表示や崩れた表示ならば、スクリーンショットが役に立ちます。
.br 

:p.:hp2.なぜ私のヘルプファイルは正しく機能しないの？ :ehp2.
:p.オリジナルのViewプログラムのほとんど使われていない機能のいくつかは実装されていません。
この理由は私がその機能の実装に取り組んでいない、もしくは単にその機能の実装のために時間を割く価値がないと判断したからです。
例えば、メタファイル、インデックス類推、アプリケーション制御API全体などはまだ実装されていません。
:p.あいにく、少なくとも開発者の中にはこれらの機能をすべて使用していると思われます、
だからあなたは読み込めなかったり、正しく動作しなかったりする特殊なファイルを見つけるかもしれません。

:h1 id=2 res=2.NewViewの使い方

:p.:hp2.NewViewの使い方 :ehp2.
:p.いったん:link reftype=hd refid=3.ファイルを開く:elink.と、あなたはさまざまな方法でそのファイルを読むことができます。
:p.あなたは:link reftype=hd refid=6.目次:elink.を読むことができますし、:link reftype=hd refid=7.索引:elink.や:link reftype=hd refid=8.検索:elink.を使うことができます。

:p.:artwork name='img1.bmp' runin. ［前］と :artwork name='img2.bmp' runin. ［次］ボタンを使用してファイルのページをめくることで、
紙の書籍のようにヘルプファイルを読むことができます。
:p.以前見たページを遡っていく :artwork name='img3.bmp' runin. ［戻る］ボタンと見た順番にページを再生する :artwork name='img4.bmp' runin. ［進む］ボタンを使うことで、
ヘルプファイルをウェブページのように使うこともできます。
:p.NewViewの色や動作の一部は 「ツール」→「オプション」メニューから変更することができます。 
:p.あなたはまたトピックに :link reftype=hd refid=9.メモ :elink.をつけたり、 :link reftype=hd refid=11.しおり :elink.を挟んだりすることができます。

:h1 id=3 res=3.ファイルを開く

:p.:hp2.ヘルプファイルを開く :ehp2.
:p.
:p.ヘルプファイルを開くには、次に示す方法のどれかを行って下さい。
:p.- すでに用意されている:link reftype=hd refid=4.ヘルプ アイコン :elink.をダブルクリックする。
:p.- :link reftype=hd refid=13.コマンドライン :elink.から &osq.view :hp1.filename:ehp1.&osq. と入力する。
:p.- NewViewの :artwork name='img5.bmp' runin. ［開く］ボタンをクリックする。
:p.- &osq.ファイル&osq. メニューから最近使用したファイルを選択し、再読み込みする。
:p.- デスクトップからヘルプファイルをドラッグ＆ドロップする。
:p.ファイルが読み込まれると、 :link reftype=hd refid=6.目次 :elink.と最初のトピックが表示されます。

:p.:hp2.注：:ehp2.ここではあなたがNewViewをオリジナルのViewの置き換えて導入したものとして書かれています。
もし置き換えていない場合は、表示されているヘルプアイコンとコマンドラインは書かれていることと異なった振る舞いをするかもしれません。
:p.:hp2.・複数のファイルをまとめて読み込む :ehp2.
:p.NewViewは同時に複数のファイルを読み込むことができ、それらは一冊の本のように扱うことができます。
そしてNewViewはファイル名のための環境変数を読み込むこともできます。
:p.例えば、OS/2 Developer&apos.s Toolkitのドキュメントの場合：
.br 
  NewView cpref 
.br 
とコマンドラインで入力すると&osq.Control Program Guide and Reference&osq.を読み込みます。 
CPREFはconfig&per.sysの中で &osq.CP1+CP2+CP3&osq. と定義されている環境変数で、
NewView（もしくはView）にヘルプファイル CP1、CP2、CP3を読み込むことを説明します。
ファイルは２つの :link reftype=hd refid=18.環境変数:elink.* によって特定されるパスの中から探されます。
:p.ファイルはすべて読み込まれて、互いにうまくつながれます。
:p.このように複数のファイルを読み込むことができるようにすることは様々な理由で非常に有効です。
例えば、 4OS/2（CMD&per.EXEの置き換え）はオリジナルのCMDのヘルプの前に4OS/2のヘルプを追加するために
この機能を使用しています。
あなたも任意のファイルで同じことができます。
:p.あなたは「ファイルを開く」ダイアログの中でCtrlキーやShiftキーを使用して複数のファイルを選択すれば、
複数のファイルを読み込むことができます。
:p.あなたが他のヘルプファイルへのリンクをクリックすると、あなたが開いているファイルを閉じることなく
NewViewは他のファイルを読み込みます。
:p.あなたは「ファイル」→「情報」メニューを使用することで開いているファイルをいつでも確認することができます。
:p.:hp2.・さらなるファイルの読み込み :ehp2.
:p.「ファイルを開く」ダイアログの中の「現在のファイルを開いたまま」チェックボックスにチェックを入れておくと、
NewViewは現在開いているファイルを閉じることなく、選択したファイルを開きます。
:p.:hp2.・ドラッグ＆ドロップ :ehp2.
:p.NewViewに &per.INF or &per.HLPファイルをドラッグ＆ドロップして、そのファイルを開くことができます。
Shiftキーを押しながらドロップすると、現在開いているファイルを閉じることなくファイルを開きます。
:p.常に存在しているトピックを表示しているウィンドウの他にも「目次」ウインドウや「索引」ウインドウなど
内容表示領域のどこにファイルをドロップしてもかまいません。
:p.:hp2.注： :ehp2.他のファイルへのリンクにはリンク先のファイルが読み込まれている時のみ機能するものがあります。

:h2 id=4 res=17.ヘルプアイコン

:p.:hp2.ヘルプアイコン :ehp2.
:p.デスクトップに表示されているヘルプアイコンは通常プログラムに &osq.view&per.exe&osq. 、
そしてパラメータにヘルプファイル名を設定した「プログラムオブジェクト」です。
:p.導入時に自動的にこれらのアイコンを作るプログラムもあります。
:p.これらのアイコンはデスクトップにあるプログラムテンプレートを使用して作成することもできます。
詳細はデスクトップのヘルプを参照して下さい。
:p.もしアイコンをデスクトップにヘルプファイルをドラッグして作成したならば、そのアイコンに意味のある名前を
つけることができません。
なぜなら、アイコンの名前を変えることはファイル名を変更することになっていて、プログラムがそのヘルプファイルを
見つけられなくなってしまうからです。
よって現時点ではプログラムオブジェクトがヘルプアイコンを作成するために推奨する方法です。
:h1 id=5 res=200.ナビパネルのタブ

:p.:hp2.ナビパネルのタブ :ehp2.
:p.左側のパネルは現在のヘルプファイルの中を移動するための方法を提供するタブをいくつか持っています。
:p.:link reftype=hd refid=6.目次 :elink.
:p.:link reftype=hd refid=7.索引 :elink.
:p.:link reftype=hd refid=8.検索 :elink.
:p.:link reftype=hd refid=9.メモ :elink.
:p.ツールバーの:artwork name='img6.bmp' runin.ボタンを押す、またはメニューから「表示」→「ナビパネルの表示」を
選択する、またはAlt + Pを押すことで、このパネルを非表示にしてヘルプファイルの表示領域をより多くすることができます。
パネルを表示するにはもう一度同じ操作をします。
:p.
ヘルプファイルを開いた時にナビパネルが表示されるのを制御するには
「ツール」→「オプション」→「一般」タブからおこないます。
:p.:hp2.注： :ehp2.多くのプログラムはヘルプファイルを開いた時に目次を表示するようにしています。
このような場合、あなたの設定よりプログラムの設定を優先してナビパネルを自動的に表示します。
:h2 id=6 res=4.目次

:p.:hp2.目次 :ehp2.
:p.
:p.ほとんどのヘルプファイルは目次を持っています。
目次はファイルの中のトピックを階層構造やツリー構造にして表示します。
目次はあなたがファイルを開いた時に、最初の見るものとなります。
:p.＋ボタンや−ボタンをクリックする、またはスペースキーを押すことで、ツリー上のブランチ（枝）を広げたり、
たたんだりすることができます。
:p.目次からトピックを表示させるためにはトピックをクリックするだけです。
カーソルキーを使用して目次に表示されているトピックを選択することもできます。
:p.目次のツリーの中の :hp2.全て :ehp2.のトピックを順番通りに見ていくには、Ctrl + ↑キーとCtrl + ↓キーを使用する、
もしくは &osq.Previous&osq. :artwork name='img1.bmp' runin.［前］ボタンと &osq.Next&osq. :artwork name='img2.bmp' runin.［次］ボタンを使用します。
これは各ページを読んでいく普通の本のようにファイルを扱う一つの方法です。
:p.「表示」メニューの中の「すべて展開」を使用することで目次全体を再表示します。
これは目次のブランチ（枝）をすべて展開しますので、速やかに目次を見渡すことができます。

しかし、このような目的には通常、:link reftype=hd refid=8.検索 :elink.や
 :link reftype=hd refid=7.索引 :elink.を使用する方が簡単です。
:h2 id=7 res=5.索引

:p.:hp2.索引について :ehp2.
:p.
:p.索引タブにはヘルプファイルのトピックやキーワードのａｂｃ順の一覧が提供されています。
探したい単語の最初の数文字を入力するだけで、その単語をすぐに探しだすことができます。
NewViewは索引の中で最初に一致した単語に自動的にジャンプします。
選択されているトピックを表示するには改行キーを押して下さい。
:p.:hp2.注：  :ehp2.
:p.ヘルプファイルは &osq.公式の&osq. 索引を持っている時とそうでない時があります。
索引は作者の手作業によって作られます、
だから（以前のViewでは）そのヘルプファイルの使いやすさは厳密に作者がおこなった作業の量に依存します。
索引がひとつもないかもしれません。
:p.しかし、各トピックのタイトルをａｂｃ順のリストにするだけでも有用な索引として提供することができます、
そしてNewViewはこのリストを作成することができます。
それからNewViewはトピックのタイトルのリストをもとからある索引（もしあれば）につなぎます。
:p.この動作が必要ないなら、「ツール」→「オプション」→「検索」タブから機能をオフにすることができます。
:h2 id=8 res=6.検索

:p.:hp2.検索 :ehp2.
:p.
:p.検索はどこから手をつけたらよいかわからない時に、情報を素早く見つけられる方法です。
検索をするには「検索」タブを開き、関連した単語を入力し、［検索］ボタンを押すだけです。
すると、その単語、もしくはそれに似た単語を含んでいるトピックすべての一覧が表示されます。
最も一致したトピックが一覧の一番上に表示され、その内容は自動的に表示されます。
:p.検索で一致した単語はトピックの中では強調表示されます。
:p.:hp2.広範囲検索 :ehp2.
:p.「ツール」メニューの中の:link reftype=hd refid=10.広範囲検索 :elink.、「全ヘルプファイルを検索」を使用することで、
あなたのシステムにあるヘルプファイルすべてを検索することもできます。
:p.:hp2.フレーズ検索 :ehp2.
:p.一つ以上の単語からなるフレーズを検索したい場合は、&odq.os/2 warp&odq.のように
フレーズをダブルクォーテーション（�W）で囲んで下さい。
:p.:hp2.一致条件に関して :ehp2.
:p.NewViewは検索条件を詳細に設定することができます。
:p.+ は一致:hp2.しなければならない:ehp2.単語を示します。
:p.- は一致:hp2.してはいけない:ehp2.単語を示します。
:p.NewViewは通常、単語の一部が一致するかどうかを調べています。
つまり、&osq.win&osq.を検索すると、NewViewは&osq.window&osq.と&osq.showing&osq.の両方を見つけだします。
よく一致したものは一覧の上位に表示されます。
:p.:hp2.NewViewの検索結果の順位付けルール :ehp2.
:p.NewViewは一致したトピックを様々な方法で順位付けします：
:p.・検索した単語とより一致しているもの
:p.・トピックの中で一致した単語の数
:p.・タイトルの中で一致
:p.・索引に登録された項目で一致
:h2 id=9 res=7.メモ

:p.:hp2.メモの追加と使い方 :ehp2.
:p.
:p.NewViewはヘルプファイルにメモ（注釈）を追加することができます。
:p.メモを追加するのは簡単です。メモを作りたい場所をクリックして、「メモ」ボタン :artwork name='img7.bmp' runin.をクリック、
それからテキストを入力して「ＯＫ」をクリックして下さい。
メモのテキストはヘルプのトピックの中に別の色で挿入されます。
（テキストの色のデフォルトは緑色です。「ツール」→「オプション」→「色」タブでこの色を変更できます。）
:p.メモを編集したり、削除したりするには彩色されたメモのテキストをクリックして下さい。
すると、あなたはメモのテキストを編集できるようになります。またそのメモを処分するには「消去」をクリックして下さい。
:p.あなたは「メモ」タブを選択することで、現在のヘルプファイルに作ったすべてのメモを見ることができる。
ここ（「メモ」タブ）ではあなたはメモの追加、編集、削除をすることができます、またメモがあるトピックにジャンプすることもできます。
:p.
:p.メモは拡張子&per.nteのファイルとして、（メモを添付された）ヘルプファイルと同じディレクトリに保存されます。
:p.:hp2.注： :ehp2.（例えばプログラムが更新されたりして）ヘルプファイルが変更されると、
メモがもともとの正しい場所に表示されなくなります。
しかし表示されなくなったメモも「メモ」タブから選択して読むことができます。
:h1 id=10 res=18.広範囲検索

:p.:hp2.広範囲検索 :ehp2.
:p.:artwork name='img8.bmp' runin. ［すべて検索］ボタンをクリックする、
「ツール」→「全ヘルプファイルを検索」メニューを選択する、またはCtrl+Sを押すことで、
システムにあるすべてのヘルプファイルを検索することができます。
:p.この検索は:link reftype=hd refid=8.ファイル内検索:elink.と似た機能だけでなく、
結果が見つけられたヘルプファイルが何であるかも示します。
:p.これらの検索はあなたが検索する内容によっては時間がかかることがあります。
あなたは検索をいつでも停止することができます。
:p.:hp2.NewViewが検索する場所に関して:ehp2.
:p.デフォルトではヘルプファイルパスの中にあるヘルプファイルを検索します。
ヘルプファイルパスはBOOKSHELFとHELP:link reftype=hd refid=18.環境変数:elink.で定義されています。
:p.ドロップダウンリストから選択したり、［選択］ボタンをクリックしてそのリストを編集することで
検索をする場所を選ぶことができます。
:p.:hp2.検索対象：標準ヘルプファイルパス :ehp2.
:p.これが標準であり、先述したようにBOOKSHELFとHELPで定義されたパスを検索します。
:p.［選択］ボタンをクリックするとヘルプファイルパスに定義されているディレクトリの中で
使用するディレクトリを選択することができます。
選択／非選択を切り換えるにはリストの中のアイテムをクリックします。
この選択をすると、ドロップダウンリストには「選択されたヘルプファイルパス」と表示されます。
:p.:hp2.検索対象：すべてのドライブ :ehp2.
:p.このオプションはあなたのシステム上にあるすべてのハードディスクを検索します。
検索場所を変更する場合は［選択］ボタンを押して下さい。
:p.ハードディスクを検索することでより多くのヘルプファイルを探しだすことができます、
しかしヘルプファイルパスを検索するより時間がかかる場合があります。
:p.:hp2.検索対象：選択されたヘルプファイルパス :ehp2.
:p.以前に検索するためにヘルプファイルパスの選択をしていると表示されます。
さらに選択をする場合は［選択］ボタンをクリックして下さい。
:p.:hp2.検索対象：ディレクトリ一覧 :ehp2.
:p.「検索するディレクトリを選択」ダイアログの中の「追加」ボタンをクリックすると、
検索リストに１つ、もしくはそれ以上のディレクトリを検索リストに追加することができます。
:p.表示されたコントロールを使用してドライブとディレクトリを選択して、
［ディレクトリの追加］ボタンをクリックすると選択したディレクトリが追加されます。
この操作は好きなだけ繰り返すことができます。
選択したディレクトリのサブディレクトリも同様に検索したいときは［サブディレクトリも含める］にチェックを入れて下さい。
このチェックを入れておくと、そのディレクトリの最後までを指定したことになります。
:p.このように任意のディレクトリを追加すると、検索場所は「ディレクトリ一覧」として示されます。
:p.:hp2.注： :ehp2.標準ヘルプファイルパスまたは選択したヘルプファイルパスに任意のディレクトリを追加すると、そのパスの一覧は任意のパスの一覧として扱われ、ヘルプファイルパスを再選択することができません。
元のヘルプファイルパスに戻すには、［標準ヘルプファイルパス］選択して、それからもう一度［選択］をクリックして下さい。
:p.:hp2.検索対象：位置の入力 :ehp2.
:p.「検索対象：」エントリーフィールドの中にドライブやディレクトリを入力することができます。
サブディレクトリも検索したい場合はディレクトリの末尾に&osq.&per.&per.&per.&osq.を追加で入力して下さい。
:p.例&colon. 
:p. 検索対象&colon. [ E&colon.&bsl.mydocs&bsl.&per.&per.&per.  ] 
:p.これはE&colon.&bsl.mydocs&bsl. とすべてのサブディレクトリの中のヘルプファイルを検索します。
:h1 id=11 res=8.しおり

:p.:hp2.しおり :ehp2.
:p.
:p.NewViewは現在開いているヘルプファイルの特定のトピックにしおりを挟むことができます。
現在開いているトピックにしおりを追加するには、しおりボタン :artwork name='img9.bmp' runin. をクリックするだけです。
:p.しおりを開くには、「しおり」メニューを選択し、開きたいしおりをクリックして下さい。
:p.「しおり」メニューの「編集」をクリックするとあなたの全てのしおりを確認したり、消去したりすることができる。
ヘルプファイルを読んでいる間、このウィンドウは開いたままにしておけますので、
登録したしおりを使って、ヘルプファイルを素早く見ていくことができます。
:p.
:p.:hp2.注：  :ehp2.
:p.一つ以上のトピックのウィンドウを開いていたとしても、NewViewのしおりは開いている
トピックのウィンドウをすべて覚えています。
:p.しおりはヘルプファイルと同じディレクトリに拡張子 &per.bmk を持ったファイルとして保存されます。
:h1 id=12 res=100.インターネットリンク

:p.:hp2.インターネットリンク :ehp2.
:p.http&colon.//www&per.google&per.comのようなウェブのURLをクリックすると、NewViewはあなたが標準として
使用しているウェブブラウザを起動します。
:p.起動するウェブブラウザはNewViewではなくOSの設定によって特定されます。
ウェブブラウザを設定するには、デスクトップ上のURLオブジェクトを開き、そして:hp2.ブラウザ:ehp2.タブの中の
ブラウザへのパスを編集し、［省略時値に設定］をクリックします。
代わりにHobbesからConfigAppsユーティリティをダウンロードする方法もあります。
:p. http&colon.//hobbes&per.nmsu&per.edu/cgi-bin/h-search?key=configapps 
.br 
:p.ブラウザはインストールした時や設定の中で、そのブラウザを標準にする機能を持っています。
:p.NewViewはインターネットアプリケーションの統合管理(IAI)によってなされた設定を使用します。
Ｅメール、ニュースグループ、ＦＴＰへのリンクはあなたが設定したプログラムに渡されます。
あるURLタイプ用のプログラムが設定されていない場合、そのURLはWebブラウザに渡されます。
:p.:hp2.ヘルプファイルの著者の方々への注意点:ehp2.
:p.オリジナルのViewはURLやeメールのリンクを解釈することはできなかったので、&osq.netscape&per.exe&osq.のような
正しいパラメータを一緒に記述したリンクを作成することがそれらを実装する唯一の方法でした。
:p.NewViewは&osq.netscape&osq.や&osq.explore&osq.、&osq.mozilla&osq.へのリンクを標準のブラウザへの
リンクに変換します。
:p.また次の形式のURLを自動認識します。
:p. http&colon.//x  https&colon.//x  ftp&colon.//x 
:p. mailto&colon.x  news&colon.x 
:p.プロトコルの接頭語がついていなくてもURLのように見えるものは認識されます。
:p. www&per.a&per.b - ブラウザ
:p. ftp&per.a&per.b - ftp
:p. a&atsign.b&per.c - eメール 
:p.ここでａ、ｂ、ｃは英数字からなる文字列です。
:p.NewViewがこれらを認識するために必要な作業はなにもありません。
:h1 id=13 res=9.コマンドライン　パラメータ

:p.:hp2.コマンドライン　パラメータ :ehp2.
:p.コマンドラインからNewViewを実行する時、様々なパラメータをNewViewに与えることができます。
これらのパラメータは必須ではありません。
:p.
:p.:hp2.NewView [オプション] [<ファイル名> [<検索文字列>]] :ehp2.
:p.viewの代替としてNewViewが導入されているなら、newviewの代わりにviewでプログラムが開始されます。
:p.:link reftype=hd refid=16.例 :elink.
:p.:hp2.<ファイル名> :ehp2.
:p.NewViewが読み込むファイルを指定します。
ファイル名１+ファイル名２ 等々と記述することで複数のファイルを一度に読み込ませることができます。
.br 
パスが特定されていない場合、ファイルは:link reftype=hd refid=18.BOOKSHELFとHELPで定義されたパス:elink.の
中から検索されます。
.br 
あなたが指定したパスやファイル名に特殊文字（空白など）が含まれている場合、
（パスを含む）ファイル名をダブルクォーテーション（�W）で囲まなければいけません。
:p.:hp2.<検索文字列> :ehp2.
:p.指定された文字列をトピックのタイトルと索引の項目から検索します。これはオリジナルのViewと互換性を保つため
通常の検索と:hp2.同じではありません:ehp2.。通常の検索をする場合は /s オプション（下記参照）を使用して下さい。
詳細は:link reftype=hd refid=14.コマンドライン　トピック検索:elink.を参照して下さい。
:p.:hp2.オプション :ehp2.
:p.:hp2./s :ehp2.
:p.ファイルを開いて、与えられた文字列の:link reftype=hd refid=8.検索:elink.をおこないます。
(do a real full text search intead of the default topic titles search)&per. 
この結果は:link reftype=hd refid=8.ナビパネルの検索タブ:elink.から検索を実行した場合と同じです。
:p.例：
.br 
あなたが開くことのできるcmdrefドキュメントからcopyという文字列を検索するには
:cgraphic.
  newview /s cmdref copy

:ecgraphic.
NewViewは複数の文字列を同時に検索することができます。
（:link reftype=hd refid=8.ナビパネルの検索タブ:elink.と同じです）
これはOR検索になります。
:cgraphic.
  newview /s cmdref net access

:ecgraphic.
AND検索をする場合は、検索する文字列をダブルクォーテーション（�W）で囲みます。
:cgraphic.
  newview /s cmdref &osq.net access&osq.

:ecgraphic.

:p.:hp2./g :ehp2.
:p.:link reftype=hd refid=10.広範囲検索:elink.をおこないます。
指定された文字列をあなたのシステムにあるヘルプファイルすべてから検索します。
:p.例：
.br 
copyという文字列を使用しているすべてのヘルプファイルの中から探す場合
:cgraphic.
  newview /g copy

:ecgraphic.
検索を実行する前にヘルプファイルを開きたい場合は第１パラメータにヘルプファイルの
ファイル名を指定して下さい。
:cgraphic.
  newview /g cmdref copy

:ecgraphic.

:p.:hp2./? :ehp2.または :hp2./h :ehp2.または :hp2./help :ehp2.
:p.コマンドラインのヘルプを表示します。
:p.&colon. :link reftype=hd refid=15.高度なパラメータ:elink.も参照して下さい。
:h2 id=14 res=13.トピック検索

:p.:hp2.トピック検索:ehp2.
:p. view <ファイル名> <トピック> 
:p.コマンドラインで指定されたトピック検索パラメータはオリジナルのviewと同じ動作をします。
:p.トピックで指定される文字列は検索されません、これはタイトルや索引の項目を示しているだけです。
この機能は私達には不便なようですが、トピックを特定してヘルプを表示するようなプログラムが使用しています。
:p.あなたは複数の文字列を指定することができます。
:p.トピック検索は次のような順で表示します：
:p.○検索文字列と一致するタイトルのトピック
:p.○検索文字列と一致する索引の項目
:p.○検索文字列を含むタイトルのトピック
:p.○検索文字列を含む索引の項目
:p.NewViewやオリジナルのviewでトピックを特定するためにこの機能を使用する場合、
開発者は期待したドキュメントが表示されることを確認して下さい。
:h2 id=15 res=14.特別なパラメータ

:p.:hp2.特別なパラメータ:ehp2.
:p.ここで説明するコマンドラインパラメータは主にソフトウェア開発者向けに用意されたものですが、
どのような目的で使用してもかまいません。
:p.:hp2./lang&colon.<言語特定文字列> :ehp2.
:p.特定の言語設定を読み込みます。この設定はLANG環境変数で指定するデフォルトの言語設定を上書きします。例：
:cgraphic.
  newview cmdref /lang&colon.en
:ecgraphic.
この例では英語の設定を読み込みます。詳細はreadme&per.txtを参照して下さい。

:p.:hp2./pos&colon.<左の位置>,<下の位置>,<ウィンドウの幅>,<ウィンドウの高さ> :ehp2.
:p.指定したパラメータに従ってプログラムのメインウィンドウの位置と大きさを設定します。
どの値も省略することはできません。値を百分率で指定する場合は値の後ろに:hp2.P :ehp2.を書いて下さい。例：
:cgraphic.
  newview /pos&colon.10P,10P,80P,80P
:ecgraphic.
:p.この例ではウィンドウを画面の中心に配置して、ウィンドウの大きさを画面の80%に設定します。

:p.:hp2./title&colon.<ウィンドウのタイトル> :ehp2.
:p.NewViewのウィンドウのタイトルを指定された文字列に設定します。
ヘルプファイルの中にどのようなタイトルが設定されていたとしてもこのウィンドウタイトルで上書きされます。
指定されたテキストが「ヘルプ」でない場合、「ヘルプ - 」というテキストが指定されたテキストの前に常に挿入されます。
どの場合でもタイトルは「ヘルプ」から始まることになります。
こうすることでウィンドウリストの中でヘルプウィンドウが識別しやすくなっています。
:p.タイトルに複数の単語を指定したい場合は、オプションも一緒にシングルクォーテーションで囲んで下さい。例：
:cgraphic.
  newview cmdref &osq./title&colon.Command Line Help&osq.

:ecgraphic.

:h2 id=16 res=15.例

:p.:hp2.例 :ehp2.
:p.以下のサンプルではnewviewがオリジナルのviewの完全な代替としてインストールされていると仮定しています。
よってviewと入力していても実際はnewviewのことになります。
:p.:hp2.view cmdref :ehp2.
:p.ヘルプパスからcmdref&per.inf (OS/2コマンドリファレンス）ファイルを開きます。
:p.:hp2.view cmdref+os2ug :ehp2.
:p.同じウィンドウにcmdref&per.infとos2ug&per.inf（OS/2ユーザガイド）の２つのファイルを開きます。
.br 
os2ug&per.infの目次はcmdref&per.infの目次の後ろに追加されます。
索引は２つのファイルの索引を結合してアルファベット順に並び直します。
:p.:hp2.view c&colon.&bsl.os2&bsl.book&bsl.os2ug&per.inf :ehp2.
:p.c&colon.&bsl.os2&bsl.bookディレクトリの中のos2ug&per.infファイルを開きます。
:p.:hp2.view &osq.c&colon.&bsl.os2 book&bsl.os2ug&per.inf&osq. :ehp2.
:p.パス、ファイル名に特殊な文字（空白など）が含まれている場合、パスとファイル名をダブルクォーテーションで囲んで下さい。
:p.:hp2.view cmdref dir :ehp2.
:p.cmdref（OS/2コマンドリファレンス）を開き、トピックの題名と索引から文字列&osq.dir&osq.を検索します。
そしてヘルプファイルのDIR命令のページを表示します。
:p.:hp2.view /s os2ug desktop :ehp2.
:p.os2ug&per.infを開き、文字列&osq.desktop&osq.を検索します。そして最も一致するものを表示します。
:p.:hp2.view /g permissions :ehp2.
:p.すべてのヘルプファイルから文字列&osq.permissions&osq.を検索します。
:p.:hp2.set myhelp=cmdref+os2ug+rexx :ehp2.
.br 
:hp2.view myhelp :ehp2.
:p.１行目は環境変数MYHELPに３つのヘルプファイルの名前を設定します。
２行目は３つのヘルプファイルを開いています。
:h1 id=17 res=10.キーボード ショートカット

:p.:hp2.キーボード ショートカット :ehp2.
:p.キーボードショートカットのほとんどはメニューの中に表示されていますが、いくつかは表示されていません。
追加されているショートカット：
:p.:hp2.Alt+F4 :ehp2.終了
:p.:hp2.Ctrl+C :ehp2.選択したテキストをクリップボードにコピー
:p.:hp2.F7 :ehp2.戻る 
:p.:hp2.F8 :ehp2.進む 
:p.:hp2.Ctrl+Left :ehp2.戻る 
:p.:hp2.F11 :ehp2.前のトピック
:p.:hp2.F12 :ehp2.次のトピック
:p.
:p.:hp2.メニューの中に表示されているショートカット :ehp2.
:p.:hp2.Ctrl+O :ehp2.ファイルを開く
:p.:hp2.Ctrl+E :ehp2.ファイルを開く（詳細指定）
:p.:hp2.Ctrl+N :ehp2.新規ウィンドウを開く
:p.:hp2.Ctrl+P :ehp2.印刷
:p.:hp2.F3 :ehp2.終了
:p.
:p.
:p.:hp2.Ctrl+A :ehp2.トピックのすべてのテキストを選択
:p.:hp2.Ctrl+Ins :ehp2.選択したテキストをクリップボードにコピー
:p.
:p.:hp2.Ctrl+F :ehp2.トピック内を検索
:p.:hp2.Ctrl+G :ehp2.再建策
:p.
:p.:hp2.Ctrl+S :ehp2.全ヘルプファイルを検索
:p.
:p.:hp2.Alt+C :ehp2.「目次」タブに切り換え
:p.:hp2.Alt+I :ehp2.「索引」タブに切り換え
:p.:hp2.Alt+S :ehp2.「検索」タブに切り換え
:p.:hp2.Alt+N :ehp2.「メモ」タブに切り換え
:p.:hp2.Alt+P :ehp2.ナビパネルの表示／非表示の切り換え
:p.:hp2.F5 :ehp2.ブランチ（枝）をすべて展開する
:p.:hp2.F6 :ehp2.ブランチ（枝）をすべて折り畳む
:p.
:p.:hp2.Esc :ehp2.戻る 
:p.:hp2.Ctrl+Right :ehp2.進む 
:p.:hp2.Ctrl+Up :ehp2.前のトピック
:p.:hp2.Ctrl+Down :ehp2.次のトピック
:p.
:p.:hp2.Ctrl+D :ehp2.しおりの追加
:p.:hp2.Ctrl+B :ehp2.しおりの編集
:p.
:p.:hp2.Ctrl+M :ehp2.カーソルの位置にメモを追加
:p.
:p.:hp2.F1 :ehp2.NewViewのヘルプ
:h1 id=18 res=11.環境変数

:p.:hp2.環境変数 :ehp2.
:p.
:p.:hp2.BOOKSHELF :ehp2.と :hp2.HELP :ehp2.の環境変数はどちらもヘルプファイルを検索するため
パス（ディレクトリのリスト）を定義してます。
NewViewは両方のパスを平等に使用しています。
:p.これらのパスは次の操作をした時に検索されます：
:p.○コマンドラインでパスのないヘルプファイルが指定された時。
:p.○「ファイル」→「開く（詳細指定）」メニューが使用された時。
:p.○ :link reftype=hd refid=10.全ヘルプファイルを検索 :elink.を使用した時。
:p.CONFIG&per.SYSファイルを編集して :hp2.HELP :ehp2.や :hp2.BOOKSHELF :ehp2.に定義されているパスに
ヘルプファイルのディレクトリを追加することができます。
もし以前のViewにもファイルを見つけられるようにしたいならば、両方の環境変数にパスを追加して下さい。
:p.:hp2.他の環境変数 :ehp2.
:p.環境変数 :hp2.LANG :ehp2.はNewViewで表示に使われる言語を決定するために使用されます。
（この設定は :link reftype=hd refid=15.コマンドライン　パラメータ:elink.&per. /langによって書替えられます）
言語についての詳細はNewViewのreadme&per.txtを見て下さい。
:p. :hp2.LOGFILES :ehp2.に定義されているディレクトリはクラッシュや他の情報のログを保存するために使用されています。
:p. :hp2.OSDIR :ehp2.に定義されているディレクトリの下のサブディレクトリ &osq.lang&osq. はNewViewの
起動時に言語ファイルを検索するために使用されます。
:p. :hp2.ULSPATH :ehp2.で定義されたパスも言語ファイルを検索するために使用されます。
:h1 id=19 res=20.著者または開発者の方々に

:p.:hp2.著者または開発者の方々に:ehp2.
:p.
:p.この章にはドキュメントの著者とソフトウェア開発者のためのいくつかの説明が書かれています。
:p.:link reftype=hd refid=12.インターネット　リンク :elink.トピックのURL認識の章も見て下さい。

:h2 id=20 res=12.ヘルプファイルの記述

:p.:hp2.OS/2 ヘルプファイルの記述:ehp2.  
:p.
:p.OS/2ヘルプファイルはIPFコンパイラを使用して作成します。
IPFはInformation Presentation Facilityの略です。
:p.IPFコンパイラは専用の言語で書かれたテキストファイルを入力として、&per.INFファイルか&per.HLPファイルを出力します。
その言語では表題、リンク、テキスト、画像のようなものをテキストで記述することができる仕様になっています。
:p.IPFコンパイラ(ipfc&per.exe)はOS/2 Developers Toolkitから入手するのが公式の方法になります。
またeComStation (http&colon.//www&per.ecomstation&per.com)にも無償でついています。
:p.IPFC用の言語は退屈なもの(例えば&amp.commaのようにすべての句読点を特殊なキーワードで入力しなければならない)なので、
ほとんどの人はIPFコンパイラに加えて別のツールを使用しています。
:p.私は簡単でＧＵＩが充実しているのでVyperhelp (http&colon.//www&per.vyperhelp&per.com)を使用しています。
このソフトはOS/2上でしか動作しませんがWindows用ヘルプ形式やHTML形式、その他の形式でも出力することができます。
ただし無料ではありません。
:p.他の選択肢をいくつか紹介します：
:p.○HyperText/2 IPF Preprocessor(http&colon.//www&per.clanganke&per.de/os2/sw/htext/ .br) - 
比較的簡単に始められる言語で書くことができ、それを非常に難しいIPF形式に変換します。無償。
:p.○HyperMake (http&colon.//www&per.hypermake&per.com)も同様にWindows用ヘルプ形式や
HTML形式で出力することができます。
:p.○Sibyl（NewViewはこれで作られています）はIPFプリプロセッサが付属しています。
:p.○PCS製IPFEditor (http&colon.//www&per.pcs-soft&per.com/productipfe212&per.htm .br)。
おそらく最も完成度が高いソフトですが、かなりの費用が必要です。
注：NewViewはIPFEができることをすべてサポートしているわけではありません！
.br 
以前は他にも多くの選択肢がありました。
ここで列挙したものは現在でも入手可能なもので、そしてサポートも受けることができます。
:h2 id=21 res=16.トピックのリソースID

:p.:hp2.トピックのリソースID :ehp2.
:p.リソースIDはアプリケーションのオンラインヘルプの著者によって、ヘルプトピックを見分けるために使用されています。
アプリケーションはリソースIDを指定してヘルプマネージャを呼び出します。
リソースIDを指定するには直接HM_DISPLAY_HELPメッセージを使用します、
もしくはPMが自動的に扱っているそれらのリソースが追加されたヘルプテーブルを間接的に参照します。
リソースIDはヘルプファイルの中に一覧表のような形で保管されています。
:p.ドキュメントの著者のためにNewViewはリソースIDを表示したり、検索したりする機能を提供しています。
:p.:hp2.リソースIDの検索:ehp2.
:p.開いているすべてのファイルの中の特定のリソースIDを検索するには「ツール」→「リソースIDで検索」を使用します。
:p.:hp2.リソースIDの表示:ehp2.
:p.トピックに関連付けられたリソースIDを見るためにはトピックのプロパティ
（マウスの右ボタンをクリック→ポップアップメニューから「プロパティ」を選択）を使用します。
:h2 id=22 res=19.トピッックの名前

:p.:hp2.トピックの名前:ehp2.
:p.
:p.リソースIDのように、トピックの名前は開発者がアプリケーションの中からヘルプのトピックへのリンクに
使用されています。
このリンクは第２パラメータ(HM_PANELNAME)を持ったHM_DISPLAY_HELPメッセージを使用しています。
:p.しかし、これらはほとんど使用されていません。
:p.「ツール」→「トピックの名前で検索」を使用すると特定のトピックの名前を検索することができます。
:euserdoc.
