class EmailLogMain

	def load
		@logList = Array.new
		File.open("mail.log.txt").each do |i|
			#check if reg exp returns non nil
			if i =~ /size=[0-9]*?,/ 
				#then add to array
				@logList << i
			end
		end
		@logList.size
	end
	
	
	#Uses RegEx to pull substring, containing message ID, out of string
	def getID(str)
		return str[(str=~/: [0-9|A-Z]/)+2..(str=~/[0-9|A-Z]: /)]
	end
	
	#associate id's with recipients for easy access later, from is easier to fetch
	def makeTable
		@table = Hash.new(Array.new)
		@logList.each do |i|
			str = getID(i)
			@table[str] = getTos(str)
		end
	end

	def getTos(str)
		ary = Array.new
		File.open("mail.log.txt").each do |i|
			#check if both reg exps return a non nil value
			if((i=~/#{str}/) && (i=~/: to=</))
				#then store the substr into array
				ary << i[(i=~/: to=</)+6..(i=~/>, /)-1]
			end
		end
		if ary.size>1
			ary.delete_at(0)
		end
		return ary
	end
	
	#returns the table from makeTable
	def getTable
		return @table
	end
	
	def print
		@logList.each do |i|
			#initialize empty string
			str = "";
			#fetch Month and Day
			str += "DATE: " + i[0..6]
			#fetch time sent
			str += "  TIME: " + i[(i=~/[0-9]*:[0-9]*:[0-9]* /)..(i=~/toilers/)-2]
			#fetch size of message
			str += "  SIZE: " + i[(i=~/size=/)+5..(i=~/, nrcpt/)-1]
			#fetch ID
			str += "  ID: " + getID(i)
			#fetch Sender
			str += "\nFROM: " + i[(i=~/from=</)+6..(i=~/>, s/)-1]
			#fetch recipient(s)
			str += "\nTO: "
			@table[getID(i)].each do |j|
				str += j+", "
			end
			#print formatted log data
			puts "\n"+str[0..-3]
		end
		puts "\nTOTAL MESSAGES SENT: #{load}"
	end
	
end

