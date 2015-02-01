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
	
	def getFromAdress
		@fromList = Array.new
		
		
	end
	
	def getToList
		return @toList
	end
	
end