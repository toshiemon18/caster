caster
======
コードのおまじないとか書き出すプログラム。
今後他の言語も対応予定。  
そのうち時間できたらクラス分けもします、そのうち。  

対応言語  
--------
  C言語,Ruby  
  
使い方
------
基本オプションで使い分けます。   
1.C言語の場合  
  $ruby caster.rb -c hoge.c
  か、もしくは  
  $ruby caster.rb --gcc hoge.c
  と入力して起動してください。「hoge.c」はファイル名です。
  
2.Rubyの場合  
  $ruby caster.rb -r hoge.rb
  か、もしくは  
  $ruby caster.rb --rb hoge.rb
  と入力して起動してください。「hoge.rb」はファイル名です。
  その後、requireするクラス名やらエンコード名やら要求されます。 
  C言語の場合同様、「end」と入力すると終了。  
  
開発環境  
--------
-エディタ  
  Sublime Text2  
  
-実行環境
  ruby 1.9.3p392 (2013-02-22) [i386-cygwin]

エラー等ありましたらTwitterの@toshiemon18までお願いします。