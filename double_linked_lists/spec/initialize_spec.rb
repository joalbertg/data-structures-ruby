# frozen_string_literal: true

require 'rspec'
require 'pry-nav'

require_relative '../double_linked_list'

RSpec.describe(DoubleLinkedList) do
  context '#initialize' do
    describe 'success' do
      it 'has length/size zero' do
        expect(subject.length).to be_zero
        expect(subject.size).to be_zero
      end

      it 'has head/first attribute set to nil' do
        expect(subject.head).to be_nil
        expect(subject.first).to be_nil
      end

      it 'has tail/last attribute set to nil' do
        expect(subject.tail).to be_nil
        expect(subject.last).to be_nil
      end
    end
  end
end
