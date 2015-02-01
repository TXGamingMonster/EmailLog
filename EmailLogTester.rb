require 'test/unit'
require_relative "EmailLogMain"

class EmailLogTester < Test::Unit::TestCase

	def tests
		log = EmailLogMain.new
		assert_equal(69, log.load)		# Checking for correct number of messages
		
	end
end