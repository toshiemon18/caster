#coding:utf-8
#Cのコードを生成するためのライブラリ
class C_maker

	def initialize(string)
		@cfile = File.open(string, "w+:utf-8")
	end

	def header_writer(header_name)
		head = "#include<" + header_name + ">"
		@cfile.puts(head)
	end

	def mainfunc
		func = "\nint main()\n{\n\n	return 0;\n}"
		@cfile.puts(func)
	end
end