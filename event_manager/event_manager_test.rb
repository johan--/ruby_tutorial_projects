require 'minitest/autorun'
require_relative 'lib/event_manager'

class EventManagerTest < MiniTest::Unit::TestCase
  def test_that_clean_phone_method_returns_same_number_when_formatted_correcty
    parsing = ParsingData.new
    assert_equal parsing.clean_phone(6154385000), "6154385000"
  end
end
