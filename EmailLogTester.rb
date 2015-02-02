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
		
		#check if id's were stored as keys, and recipient number at key
		#top
		assert_equal(true, table.has_key?("A54F11B2003"))
		assert_equal(1, table.values_at("A54F11B2003")[0].length)
		#mid
		assert_equal(true, table.has_key?("168191BA094"))
		assert_equal(1, table.values_at("168191BA094")[0].length)
		#last
		assert_equal(true, table.has_key?("9E59D1BA094"))
		assert_equal(1, table.values_at("9E59D1BA094")[0].length)
		#something with more than 1 recipient
		assert_equal(3, table.values_at("1915B1B2004")[0].length)
		
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

