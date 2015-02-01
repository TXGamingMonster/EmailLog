class EmailLogMain

	def load
		@logList = Array.new
		
		ct = 0
		File.open("mail.log.txt").each do |i|
			if i =~ /: to=</ 
				@logList << i
			elsif i =~ /removed/
				ct+=1
			end
		end
		ct
	end
	
	def getAddress
		@toList = Array.new
		
		@logList.each do |line|
			if line =~ /[<]*[>]/
				@toList << line.slice(line.index("<")+1..line.index(">")-1)
			end
		end
	end
	
	def getToList
		return @toList
	end
	
	def beast
		@stringList = Array.new
		str = ""
		File.open("mail.log.txt").each do |i|
			str = ""
			if(i =~ /: to=</)
				str += i[0..15] + " "
				str += i[(i=~/: [0-9|A-Z]/)+2..(i=~/[0-9|A-Z]: /)]
				#@stringList << str
				puts str
			end
		end
		#puts @stringList.size
	end
end

log = EmailLogMain.new
log.beast