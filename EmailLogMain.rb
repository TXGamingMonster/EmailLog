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
				@toList << line.slice(/[<]*[>]/)
			end
		end
		return 
	end
	
	def getToList
		return @toList
	end
	
end