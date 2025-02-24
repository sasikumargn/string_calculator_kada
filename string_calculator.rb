class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?
    digits_array = digits(numbers)
    delimiter_pattern = delimiter(numbers)

    negatives = digits_array.select(&:negative?)
    raise "negative numbers not allowed #{negatives.join(',')}" unless negatives.empty?
    digits_array.reduce {|sum, d| sum + d}
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
    if numbers.start_with?("//[")
      numbers.scan(/\[(.*?)\]/).flatten.map { |d| Regexp.escape(d) }.join("|")
    else
      Regexp.escape(numbers[2])
    end
  end

end