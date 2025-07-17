# frozen_string_literal: true

require 'string_calculator'

RSpec.describe StringCalculator do
  describe '#add_numbers' do
    let(:numbers_string) { '1,2' }
    let(:result) { described_class.new.add_numbers(numbers_string) }

    context 'when string is empty' do
      let(:numbers_string) { '' }

      it 'returns 0' do
        expect(result).to eq(0)
      end
    end

    context 'when string is nil' do
      let(:numbers_string) { nil }

      it 'returns 0' do
        expect(result).to eq(0)
      end
    end

    context 'when string contains 2 numbers separated by comma' do
      let(:numbers_string) { '2,3' }

      it 'returns sum of given numbers' do
        expect(result).to eq(5)
      end
    end

    context 'when string contains only one number' do
      let(:numbers_string) { '5' }

      it 'returns that just that number' do
        expect(result).to eq(5)
      end
    end

    context 'when string contains many numbers separated by comma' do
      let(:numbers_string) { '2,3,4,5,11,12' }

      it 'returns the sum of all numbers' do
        expect(result).to eq(37)
      end
    end
  end
end
