class EmailLogMain

	def load
		@logList = Array.new
		File.open("mail.log.txt").each do |i|
			if i =~ /size=[0-9]*?,/ 
				@logList << i
			end
		end
		@logList.size
	end
	
	def getID(logListIndex)
		id = @loglist[logListIndex].slice((/: [0-9|A-Z]/)+2..(/[0-9|A-Z]: /))
		return id
	end
end

