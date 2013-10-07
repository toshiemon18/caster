#-*- coding:utf-8 -*-
$:.unshift File.dirname(__FILE__)
require 'optparse'
require 'readline'
require './rbwrite.rb'
require './cwrite.rb'

#(☝ ՞ਊ ՞）☝ご都合主義よねぇ～
$fname = nil

OptionParser.new do |opt|
	#オプション定義
	#あとで追加可能、以下のフォームで追加可能
	#opt.on(shortopt, longopt, WHAT'S) {|string| FNAME = string}
	opt.on('-r [string]', '--rb [string]', "make ruby code") {|string| $fname = string}
	opt.on('-c string', '--gcc string', "make c code") {|string| $fname = string}
	#オプションの解析
	opt.parse(ARGV)
end

opt = ARGV.shift

#コマンドラインでファイル名が定義されていない時の処理
if $fname == nil then 
	print "File name : "
	$fname = gets.to_s
	$fname = $fname.chomp
end

#optを参照して生成するコードの種類を分岐
case opt

	#オプションがrubyのものの時の処理
	when '-r', '--rb'
		#クラスの読み込み
		rbwrite = Rb_maker.new($fname)

		#記述エンコードの要求と出力
		puts "encode name"
		encode = Readline.readline("-> ")
		#文字列整形
		encode = encode.chomp
		rbwrite.encode_writer(encode)

		#requireの有無を要求
		puts "Do you need class ?"
		yn = Readline.readline("(y or n ) -> ")
		#文字列整形
		yn = yn.chomp
		case yn
			#yesのとき
			when 'y'
				for i in 0..100
					#必要なクラス名、ファイル名を要求
					puts "Class name"
					class_name = Readline.readline("-> ")
					class_name = class_name.chomp

					if class_name == 'end' then 
						break
					end

					rbwrite.require_writer(class_name)
				end

			#noのとき
			when 'n'
				exit

		end
		#書き出したコードにエラーがないか検証
		rbwrite.checker

	#C言語のオプションを受けたとき
	when '-c', '--gcc'
		#クラスを生成
		cwrite = C_maker.new($fname)

		#ヘッダー名を要求
		for i in 0..100
			print "header name : "
			head = Readline.readline
			head = head.chomp

			if head == 'end'
				break
			end

			cwrite.header_writer(head)
		end

		#メイン関数の書き出し
		cwrite.mainfunc

	#オプションが入力されなかった時の処理
	when nil
		puts "Please input options!"
		exit
end

puts "complete!"