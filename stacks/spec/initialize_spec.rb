# frozen_string_literal: true

require 'rspec'
require 'pry-nav'

require_relative '../stack'

RSpec.describe(Stack) do
  context '#initialize' do
    describe 'success' do
      it 'has length/size zero' do
        expect(subject.length).to be_zero
        expect(subject.size).to be_zero
      end

      it 'has head/top attribute set to nil' do
        expect(subject.head).to be_nil
        expect(subject.top).to be_nil
      end
    end
  end
end
