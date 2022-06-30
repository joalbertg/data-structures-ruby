# frozen_string_literal: true

require 'rspec'
require 'pry-nav'

require_relative '../queue'

RSpec.describe(Queue) do
  context '#push' do
    describe 'when insert an element' do
      let(:queue) { described_class.new }

      before { queue.push('a') }

      it 'has length/size one' do
        expect(queue.length).to eq(1)
        expect(queue.size).to eq(1)
      end

      it 'has head/front pointing to element [a]' do
        expect(queue.head.value).to eq('a')
        expect(queue.front.value).to eq('a')
      end
    end

    describe 'when more than one element is inserted' do
      let(:queue) { described_class.new }
      let(:elements) { ('a'..'f').to_a }

      before { elements.each { |element| queue.push(element) } }

      it 'has a length/size equal to the size of the array elements' do
        expect(queue.length).to eq(elements.size)
        expect(queue.size).to eq(elements.size)
      end

      it 'has the head and front attributes pointing to same address memory element' do
        expect(queue.head).to equal(queue.front)
      end

      it 'has the head.value equal to the first value of the array elements' do
        expect(queue.head.value).to eq(elements.first)
      end
    end
  end
end
