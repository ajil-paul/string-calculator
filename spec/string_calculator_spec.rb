# frozen_string_literal: true

require "string_calculator"

RSpec.describe StringCalculator do
  describe "#add_numbers" do
    let(:numbers_string) { "1,2" }
    let(:result) { described_class.new.add_numbers(numbers_string) }

    context "when string is empty" do
      let(:numbers_string) { "" }

      it "returns 0" do
        expect(result).to eq(0)
      end
    end

    context "when string is nil" do
      let(:numbers_string) { nil }

      it "returns 0" do
        expect(result).to eq(0)
      end
    end

    context "when string contains 2 numbers separated by comma" do
      let(:numbers_string) { "2,3" }

      it "returns sum of given numbers" do
        expect(result).to eq(5)
      end
    end

    context "when string contains only one number" do
      let(:numbers_string) { "5" }

      it "returns that just that number" do
        expect(result).to eq(5)
      end
    end

    context "when string contains many numbers separated by comma" do
      let(:numbers_string) { "2,3,4,5,11,12" }

      it "returns the sum of all numbers" do
        expect(result).to eq(37)
      end
    end

    context "when string contains new lines between numbers instead of commas" do
      let(:numbers_string) { "1\n2,3,\n4" }

      it "treats the new line as a separator and returns sum of all numbers" do
        expect(result).to eq(10)
      end
    end

    context "when string contains delimiter at the starting" do
      let(:numbers_string) { "//;\n1;2\n3" }

      it "separates the numbers using the delimiter and return its total" do
        expect(result).to eq(6)
      end
    end

    context "when delimiter is an alphabet" do
      let(:numbers_string) { "//a\n1a2\n3" }

      it "separates the numbers using the delimiter properly and return its total" do
        expect(result).to eq(6)
      end
    end

    context "when delimiter is a number" do
      let(:numbers_string) { "//2\n122\n3" }

      it "throws an error with a proper message" do
        expect { result }.to raise_error(StandardError, "Delimiter is invalid")
      end
    end

    context "when string contains negative numbers" do
      let(:numbers_string) { "//$\n1$-2$3$-4" }

      it "throws an error with a proper message" do
        expect { result }.to raise_error(StandardError, "Negative numbers not allowed -2, -4")
      end
    end

    context "when string contains numbers greater than 1000" do
      let(:numbers_string) { "//$\n1$1000$1001$999" }

      it "ignores numbers greater than 1000 and returns sum of rest of the numbers" do
        expect(result).to eq(2000)
      end
    end

    context "when delimiter contains more than one character wrapped in square brackets" do
      let(:numbers_string) { "//[***]\n1***2***3" }

      it "extracts the delimiter from the square bracket and returns the sum of numbers separated using it" do
        expect(result).to eq(6)
      end
    end

    context "when string contains multiple delimiters" do
      let(:numbers_string) { "//[*][%%][***]\n1*2%%33***4" }

      it "returns the sum of numbers separated using each delimiter" do
        expect(result).to eq(40)
      end
    end
  end
end
