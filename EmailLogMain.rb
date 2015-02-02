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
	
	
	#Uses RegEx to pull substring, containing message ID, out of string
	def getID(str)
		return str[(str=~/: [0-9|A-Z]/)+2..(str=~/[0-9|A-Z]: /)]
	end
	
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
			if((i=~/#{str}/) && (i=~/: to=</))
				ary << i[(i=~/: to=</)+6..(i=~/>, /)-1]
			end
		end
		if ary.size>1
			ary.delete_at(0)
		end
		return ary
	end
	
	def getTable
		return @table
	end
	
	def print
		@logList.each do |i|
			str = "";
			str += "DATE: " + i[0..6]
			str += "\nTIME: " + i[(i=~/[0-9]*:[0-9]*:[0-9]* /)..(i=~/toilers/)-2]
			str += "\nSIZE: " + i[(i=~/size=/)+5..(i=~/, nrcpt/)-1]
			str += "\nID: " + getID(i)
			str += "\nFROM: " + i[(i=~/from=</)+6..(i=~/>, s/)-1]
			str += "\nTO: "
			@table[getID(i)].each do |j|
				str += j+", "
			end
			puts "\n"+str[0..-3]
		end
	end
	
end

