require 'test/unit'
require_relative "EmailLogMain"

class EmailLogTester < Test::Unit::TestCase

	def tests
		log = EmailLogMain.new
		assert_equal(61, log.load)		# Checking for correct number of messages
		assert_equal(69, log.getToList.size)	# Checking for correct number of recipients
		log.getToList.each do |i|
			assert_true(i.includes('@'))
		end
	end
end