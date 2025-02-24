class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?
    digits_array = digits(numbers)
    return digits_array[0] if digits_array.length == 1

    digits_array.sum
  end

  def digits(numbers)
    numbers.split(',').map(&:to_i)
  end
end