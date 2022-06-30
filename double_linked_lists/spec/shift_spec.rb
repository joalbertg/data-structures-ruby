# frozen_string_literal: true

require 'rspec'
require 'pry-nav'

require_relative '../double_linked_list'

RSpec.describe(DoubleLinkedList) do
  context '#shift' do
    describe 'when empty' do
      let(:list) { described_class.new }
      let(:element) { list.shift }

      it 'has a nil element' do
        expect(element).to be_nil
      end

      it 'has head/first attribute set to nil' do
        expect(list.head).to be_nil
        expect(list.first).to be_nil
      end

      it 'has tail/last attribute set to nil' do
        expect(list.tail).to be_nil
        expect(list.last).to be_nil
      end
    end

    describe 'when it has an element' do
      let(:list) { described_class.new }
      before { list.push('a') }

      it 'returns element [a]' do
        expect(list.shift.value).to eq('a')
      end

      it 'has lentgh/size zero' do
        list.shift

        expect(list.length).to be_zero
        expect(list.size).to be_zero
      end

      it 'has head/first attribute set to nil' do
        list.shift

        expect(list.head).to be_nil
        expect(list.first).to be_nil
      end

      it 'has tail/last attribute set to nil' do
        list.shift

        expect(list.tail).to be_nil
        expect(list.last).to be_nil
      end
    end

    describe 'when it has various elements' do
      let(:list) { described_class.new }
      let(:elements) { ('a'..'f').to_a }

      before do
        elements.each { |element| list.push(element) }
      end

      it 'returns element [a]' do
        expect(list.shift.value).to eq(elements.first)
      end

      it 'has length/size equal to array elements - 1' do
        list.shift

        expect(list.length).to eq(elements.size - 1)
        expect(list.size).to eq(elements.size - 1)
      end

      it 'has attributes head/first pointing to element [b]' do
        list.shift

        expect(list.head.value).to eq('b')
        expect(list.first.value).to eq('b')
      end

      it 'has attributes tail/last pointing to element [f]' do
        list.shift

        expect(list.tail.value).to eq('f')
        expect(list.last.value).to eq('f')
      end

      it 'has head.back attribute pointing to nil' do
        list.shift
        expect(list.head.back).to be_nil
      end
    end
  end
end
