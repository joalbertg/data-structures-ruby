# frozen_string_literal: true

require 'rspec'
require 'pry-nav'

require_relative '../stack'

RSpec.describe(Stack) do
  context '#push' do
    describe 'when insert an element' do
      let(:stack) { described_class.new }

      before { stack.push('a') }

      it 'has length/size one' do
        expect(stack.length).to eq(1)
        expect(stack.size).to eq(1)
      end

      it 'has head/top pointing to element [a]' do
        expect(stack.head.value).to eq('a')
        expect(stack.top.value).to eq('a')
      end
    end

    describe 'when more than one element is inserted' do
      let(:stack) { described_class.new }
      let(:elements) { ('a'..'f').to_a }

      before { elements.each { |element| stack.push(element) } }

      it 'has a length/size equal to the size of the array elements' do
        expect(stack.length).to eq(elements.size)
        expect(stack.size).to eq(elements.size)
      end

      it 'has the head and top attributes pointing to same address memory element' do
        expect(stack.head).to equal(stack.top)
      end

      it 'has the head.value equal to the last value of the array elements' do
        expect(stack.head.value).to eq(elements.last)
      end
    end
  end
end
