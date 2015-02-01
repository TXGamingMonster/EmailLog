class EmailLogMain

	def load
		@logList = Array.new
		File.open("mail.log.txt").each do |i|
			if i =~ /: to=</ 
				@logList << i
			end
		end
		@logList.size
	end

end