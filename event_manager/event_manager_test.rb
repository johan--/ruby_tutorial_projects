require 'minitest/autorun'
require_relative 'lib/event_manager'

class EventManagerTest < MiniTest::Unit::TestCase
  def test_that_clean_phone_method_returns_same_number_when_formatted_correcty
    parsing = ParsingData.new
    assert_equal parsing.clean_phone("6154385000"), "6154385000"
  end

  def test_that_clean_phone_method_parses_hyphens_from_string
    parsing = ParsingData.new
    assert_equal parsing.clean_phone("414-520-5000"), "4145205000"
  end

  def test_that_clean_phone_method_parses_parentheses_from_string
    parsing = ParsingData.new
    assert_equal parsing.clean_phone("(941)979-2000"), "9419792000"
  end

  def test_that_clean_phone_method_parses_spaces_from_string
    parsing = ParsingData.new
    assert_equal parsing.clean_phone("613 565-4000"), "6135654000"
  end

  def test_that_clean_phone_method_parses_periods_from_string
    parsing = ParsingData.new
    assert_equal parsing.clean_phone("315.450.6000"), "3154506000"
  end

  def test_that_clean_phone_method_parses_first_1_from_11_char_string
    parsing = ParsingData.new
    assert_equal parsing.clean_phone("14018685000"), "4018685000"
  end

  def test_that_clean_phone_method_returns_an_empty_string_with_invalid_number
    parsing = ParsingData.new
    assert_equal parsing.clean_phone("9.82E+00"), ""
  end

  def test_that_clean_zipcode_method_returns_self_when_formatted_correctly
    parsing = ParsingData.new
    assert_equal parsing.clean_zipcode("20010"), "20010"
  end
end
