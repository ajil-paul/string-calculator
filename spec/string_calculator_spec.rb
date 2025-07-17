# frozen_string_literal: true

require 'string_calculator'

RSpec.describe StringCalculator do
  describe '#add_numbers' do
    let(:numbers) { '1,2' }
    let(:result) { described_class.new.add_numbers(numbers) }

    context 'when number string is empty' do
      let(:numbers) { '' }

      it 'returns 0' do
        expect(result).to eq(0)
      end
    end

    context 'when number string is nil' do
      let(:numbers) { nil }

      it 'returns 0' do
        expect(result).to eq(0)
      end
    end
  end
end
