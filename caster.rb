#-*- coding:utf-8 -*-
require 'optparse'

OptionParser.new do |opt|
	#オプション定義
	#あとで追加可能
	#opt.on(shortopt, longopt, )
	opt.on('-r', '--rb', "make ruby code")
	opt.on('-c', '--gcc', "make c code") 

	#オプションの解析
	opt.parse(ARGV)
end

#ARGVにshiftをかけてoptに格納
opt = ARGV.shift

#ここから本体
#optを参照して生成するコードの種類を分岐
case opt

	#オプションがrubyのものの時の処理
	when '-r', '--rb'

		print "File name : "
		#ファイル名
		fname = gets.to_s
		#入力されたファイル名から特殊文字を消去
		fname = fname.chomp
		#新規Rubyコードの作成
		rbfile = File.open(fname, 'w')

		#エンコード名を要求
		print "Whan encode? "
		#エンコード名
		encode = gets.to_s
		#エンコードを追加、文字列を整形して追加
		code = "#coding:"+encode.chomp
		rbfile.puts(code)

		print "You need require? (y or n) : "
		yn = gets.to_s

		#クラスが必要か確認し、分岐する
		case yn
			when "y\n"
				for i in 2..102
					print "What class do you need? : "
					#クラスの名前
					cname = gets.to_s

					#「end」と入力されたらプログラムを終了する
					if cname == "end\n" then
						break
					end

					#入力されたコードを整形
					cname = cname.chomp
					rbcode = "require '"+cname+"'"

					#ファイルにコードを書き出す
					rbfile.puts(rbcode)
				end
			
			when "n\n"
				exit
		end

	#C言語のオプションを受けたとき
	when '-c', '--gcc'
		print "File name : "
		#ファイル名
		fname = gets.to_s
		#入力されたファイル名から特殊文字を消去
		fname = fname.chomp
		#新規にCのコードを作成
		cfile = File.open(fname, 'w')

		code = "#include<stio.h>"
		cfile.puts(code)

		for i in 0..100
			print "What Hedder include? "
			#ヘッダーファイル名
			hname = gets.to_s

			#「end」と入力されたらプログラムを終了する
			if hname == "end\n" then 
				break

			else
				hname = hname.chomp
				cfile.print("#include<"+hname+">\n")

			end
		end

		main_func = "\nint main()\n{\n	return 0;\n}\n"
		cfile.print(main_func)
	
	#オプションが入力されなかった時の処理
	when nil
		puts "Please input options!"
		exit
end

puts "complete!"