require 'test/unit'
require_relative "EmailLogMain"

class EmailLogTester < Test::Unit::TestCase

	def tests
		log = EmailLogMain.new
		# Checking for correct number of messages
		assert_equal(61, log.load)
		
		log.makeTable
		table = log.getTable
		# Asserting that number of message ID's equal number of messages
		assert_equal(61,table.length)		
		
		# Counting number of to addresses in HashTable
		ct=0
		table.keys.each do |i|
			ct+=table[i].length
		end
		# Checking for correct number of to addresses
		assert_equal(69, ct)
		
		log.print
	end
end

