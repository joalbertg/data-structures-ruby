# frozen_string_literal: true

require 'rspec'
require 'pry-nav'

require_relative '../queue'

RSpec.describe(Queue) do
  context '#initialize' do
    describe 'success' do
      it 'has length/size zero' do
        expect(subject.length).to be_zero
        expect(subject.size).to be_zero
      end

      it 'has head/front attribute set to nil' do
        expect(subject.head).to be_nil
        expect(subject.front).to be_nil
      end
    end
  end
end
