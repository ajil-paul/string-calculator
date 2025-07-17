# frozen_string_literal: true

class StringCalculator
  def add_numbers(numbers)
    return 0 if numbers.nil? || numbers.empty?

    extracted_numbers = numbers.split(',').map(&:to_i)

    extracted_numbers.sum
  end
end
