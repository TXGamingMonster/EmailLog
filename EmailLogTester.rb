require 'test/unit'
require_relative "EmailLogMain"

class EmailLogTester < Test::Unit::TestCase

	def tests
		log = EmailLogMain.new
		assert_equal(61, log.load)		# Checking for correct number of messages
<<<<<<< HEAD
		log.getAddress
		
		
		assert_equal(69, log.getToList.size)	# Checking for correct number of recipients
		log.getToList.each do |i|
			assert_equal(true, (i.include? "@"))	# Checking each recipient for valid address
		end
		
		log.getDateList.each do |i|
			assert_equal(15, i.length)
			
		end
		
		log.getIDList.each do |i|
			assert_equal(11, i.length)
		end
		
		
=======
>>>>>>> 3a0d9032bc0297f331bdcdd4e668d26a3768aa65
	end
end

