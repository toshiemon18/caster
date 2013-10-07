#coding:utf-8
#Rubyのコードを生成するためのライブラリ
class Rb_maker

	def initialize(string)
		#ファイル名を設定
		@rbfile = File.open(string, "w+:utf-8")
	end

	def encode_writer(encode)
		#渡された引数の文字列を整形
		encode = "#-*- coding: " + encode + " -*-"
		#openingで開いたファイルにエンコードを書き出す
		@rbfile.puts(encode)
	end

	def require_writer(class_neme)
		#渡された引数の文字列を整形
		cname = "require '" + class_neme + "'"
		@rbfile.puts(cname)
	end

	def checker
		#ファイルを1行ずつ読み込んでevalで処理
		@rbfile.each_line do |code|
			res = eval(code)

			if(res != nil) then
				#エラーがあればファイルを削除してプログラム終了
				puts "Syntax Error!!"
				File.delete(@fname)
				exit
			end
		end
	end
end