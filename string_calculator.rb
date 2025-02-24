class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?
    digits_array = digits(numbers)
    return digits_array[0] if digits_array.length == 1

    digits_array.sum
  end

  def digits(numbers)
    numbers.split(delimiter(numbers)).map(&:to_i)
  end

  def delimiter(numbers)
    if has_custom_delimiter?(numbers)
      custom_delimiters(numbers)
    else
      /,|\n/
    end
  end

  def has_custom_delimiter?(numbers)
    numbers.start_with?("//")
  end

  def custom_delimiters(numbers)
    delimiters = numbers.match(%r{//(\[.*?\])+\n})
    if delimiters
      delimiters[1].scan(/\[(.*?)\]/).flatten.map { |d| Regexp.escape(d) }.join("|")
    else
      delimiter_section = numbers.split("\n", 2).first
      Regexp.escape(delimiter_section[2..]) 
    end
  end

end