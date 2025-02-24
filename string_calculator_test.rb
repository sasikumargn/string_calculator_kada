require 'minitest/autorun'
require_relative 'string_calculator'

class StringCalculatorTest < Minitest::Test
  def setup
    @calc = StringCalculator.new
  end

	def test_empty_string_returns_zero
    assert_equal 0, @calc.add("")
  end

	def test_single_number
    assert_equal 1, @calc.add("1")
    assert_equal 5, @calc.add("5")
  end

end