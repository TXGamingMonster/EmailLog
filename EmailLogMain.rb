class EmailLogMain

	def load
		@logList = Array.new
		
		ct = 0
		File.open("mail.log.txt").each do |i|
			if i =~ /size=[0-9]*?,/ 
				@logList << i
			end
		end
		@logList.size
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

log = EmailLogMain.new
log.beast
