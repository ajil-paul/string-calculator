# frozen_string_literal: true

class StringCalculator
  def add_numbers(numbers)
    return 0 if numbers.nil? || numbers.empty?

    delimiters = ["\n", ","]
    if numbers.start_with?("//")
      header, = numbers.split("\n", 2)
      delimiters << header.slice(2..)
    end

    separator_regex = Regexp.union(delimiters)
    extracted_numbers = numbers.split(separator_regex).map(&:to_i)

    extracted_numbers.sum
  end
end
