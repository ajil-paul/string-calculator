# frozen_string_literal: true

class StringCalculator
  def add_numbers(numbers)
    return 0 if numbers.nil? || numbers.empty?

    delimiters = ["\n", ","]
    delimiters << extract_delimiter(numbers) if numbers.start_with?("//")

    separator_regex = Regexp.union(delimiters)
    extracted_numbers = numbers.split(separator_regex).map(&:to_i)
    validate_no_negatives(extracted_numbers)

    extracted_numbers.sum
  end

  private

  def extract_delimiter(numbers)
    header = numbers.split("\n", 2).first
    delimiter = header.slice(2..)
    raise StandardError, "Delimiter is invalid" if /\d/.match? delimiter

    delimiter
  end

  def validate_no_negatives(numbers)
    negative_numbers = numbers.select(&:negative?)

    return if negative_numbers.empty?

    message = "Negative numbers not allowed #{negative_numbers.join(', ')}"
    raise StandardError, message
  end
end
