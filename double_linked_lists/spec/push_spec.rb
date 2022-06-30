# frozen_string_literal: true

require 'rspec'
require 'pry-nav'

require_relative '../double_linked_list'

RSpec.describe(DoubleLinkedList) do
  context '#push' do
    describe 'when insert an element' do
      let(:list) { described_class.new }

      before { list.push('a') }

      it 'has length/size one' do
        expect(list.length).to eq(1)
        expect(list.size).to eq(1)
      end

      it 'has head/first pointing to element [a]' do
        expect(list.head.value).to eq('a')
        expect(list.first.value).to eq('a')
      end

      it 'has tail/last pointing to element [a]' do
        expect(list.tail.value).to eq('a')
        expect(list.last.value).to eq('a')
      end

      it 'has head/first and tail/last attributes pointing to same address memory element' do
        expect(list.head).to equal(list.tail)
        expect(list.first).to equal(list.last)
      end
    end

    describe 'when more than one element is inserted' do
      let(:list) { described_class.new }
      let(:elements) { ('a'..'f').to_a }

      before { elements.each { |element| list.push(element) } }

      it 'has a length/size equal to the size of the array elements' do
        expect(list.length).to eq(elements.size)
        expect(list.size).to eq(elements.size)
      end

      it 'has the head and first attributes pointing to same address memory element' do
        expect(list.head).to equal(list.first)
      end

      it 'has the tail and last attributes pointing to same address memory element' do
        expect(list.tail).to equal(list.last)
      end

      it 'has the head.value equal to the first value of the array elements' do
        expect(list.head.value).to eq(elements.first)
      end

      it 'has the tail.value equal to the last value of the array elements' do
        expect(list.tail.value).to eq(elements.last)
      end

      it 'has the tail.next attribute pointing to nil' do
        expect(list.tail.next).to be_nil
      end

      it 'has the tail.back.value attribute pointing to element [e]' do
        expect(list.tail.back.value).to eq('e')
      end
    end
  end
end
