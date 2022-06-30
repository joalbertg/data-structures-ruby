# frozen_string_literal: true

require 'rspec'
require 'pry-nav'

require_relative '../stack'

RSpec.describe(Stack) do
  context '#pop' do
    describe 'when empty' do
      let(:stack) { described_class.new }
      let(:element) { stack.pop }

      it 'has a nil element' do
        expect(element).to be_nil
      end

      it 'has head/top attribute set to nil' do
        expect(stack.head).to be_nil
        expect(stack.top).to be_nil
      end
    end

    describe 'when it has an element' do
      let(:stack) { described_class.new }
      before { stack.push('a') }

      it 'returns element [a]' do
        expect(stack.pop.value).to eq('a')
      end

      it 'has lentgh/size zero' do
        stack.pop

        expect(stack.length).to be_zero
        expect(stack.size).to be_zero
      end

      it 'has head/top attribute set to nil' do
        stack.pop

        expect(stack.head).to be_nil
        expect(stack.top).to be_nil
      end
    end

    describe 'when it has various elements' do
      let(:stack) { described_class.new }
      let(:elements) { ('a'..'f').to_a }

      before do
        elements.each { |element| stack.push(element) }
      end

      it 'returns element [f]' do
        expect(stack.pop.value).to eq(elements.last)
      end

      it 'has length/size equal to array elements - 1' do
        stack.pop

        expect(stack.length).to eq(elements.size - 1)
        expect(stack.size).to eq(elements.size - 1)
      end

      it 'has attributes head/top pointing to element [e]' do
        stack.pop

        expect(stack.head.value).to eq('e')
        expect(stack.top.value).to eq('e')
      end
    end
  end
end
