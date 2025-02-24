require 'minitest/autorun'
require_relative 'string_calculator'

class StringCalculatorTest < Minitest::Test
  def setup
    @calc = StringCalculator.new
  end

	def test_empty_string_returns_zero
    assert_equal 0, @calc.add("")
  end

end