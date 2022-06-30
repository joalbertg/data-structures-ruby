# frozen_string_literal: true

require_relative 'node'
require 'pry-nav'

class Stack
  attr_reader :head, :length

  alias top head
  alias size length

  def initialize
    @length = 0
  end

  def push(item)
    node = Node.new(item, head)
    @head = node
    @length += 1
  end

  def pop
    return if length.zero?

    current = head
    @head = head.next
    current.next = nil
    @length -= 1

    current
  end

  def clear
    @head = nil
    @length = 0
  end

  def empty?
    length.zero?
  end
end

if __FILE__.include?($PROGRAM_NAME)
  stack = Stack.new
  items = ('a'..'f').to_a

  items.each { |item| stack.push(item) }
  node = stack.pop
  stack.clear

  puts node.value
end
