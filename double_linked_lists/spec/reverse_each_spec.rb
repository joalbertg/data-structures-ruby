# frozen_string_literal: true

require 'rspec'
require 'pry-nav'

require_relative '../double_linked_list'

RSpec.describe(DoubleLinkedList) do
  context '#reverse_each' do
    describe 'when empty' do
      it 'has no elements' do
        elements = []
        subject.reverse_each { |element| elements << element.value }

        expect(elements).to be_empty
      end
    end

    describe 'when more than one element is inserted' do
      let(:list) { described_class.new }
      let(:elements) { ('a'..'f').to_a }

      before { elements.each { |element| list.push(element) } }

      it 'has elements equal to the elements of the array in reverse' do
        current_elements = []
        list.reverse_each { |element| current_elements << element.value }

        expect(current_elements).to eq(elements.reverse)
      end
    end
  end
end
