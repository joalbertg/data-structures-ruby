# frozen_string_literal: true

require 'rspec'
require 'pry-nav'

require_relative '../queue'

RSpec.describe(Queue) do
  context '#shift' do
    describe 'when empty' do
      let(:queue) { described_class.new }
      let(:element) { queue.shift }

      it 'has a nil element' do
        expect(element).to be_nil
      end

      it 'has head/front attribute set to nil' do
        expect(queue.head).to be_nil
        expect(queue.front).to be_nil
      end
    end

    describe 'when it has an element' do
      let(:queue) { described_class.new }
      before { queue.push('a') }

      it 'returns element [a]' do
        expect(queue.shift.value).to eq('a')
      end

      it 'has lentgh/size zero' do
        queue.shift

        expect(queue.length).to be_zero
        expect(queue.size).to be_zero
      end

      it 'has head/front attribute set to nil' do
        queue.shift

        expect(queue.head).to be_nil
        expect(queue.front).to be_nil
      end
    end

    describe 'when it has various elements' do
      let(:queue) { described_class.new }
      let(:elements) { ('a'..'f').to_a }

      before do
        elements.each { |element| queue.push(element) }
      end

      it 'returns element [a]' do
        expect(queue.shift.value).to eq(elements.first)
      end

      it 'has length/size equal to array elements - 1' do
        queue.shift

        expect(queue.length).to eq(elements.size - 1)
        expect(queue.size).to eq(elements.size - 1)
      end

      it 'has attributes head/front pointing to element [b]' do
        queue.shift

        expect(queue.head.value).to eq('b')
        expect(queue.front.value).to eq('b')
      end
    end
  end
end
