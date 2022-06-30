# frozen_string_literal: true

require_relative 'node'
require 'pry-nav'

class Queue
  attr_reader :head, :length

  alias front head
  alias size length

  def initialize
    @length = 0
    @tail = nil
  end

  def push(item)
    node = Node.new(item)

    if head
      tail.next = node
    else
      @head = node
    end

    @tail = node
    @length += 1
  end

  def shift
    return if length.zero?

    current = head
    @head = head.next
    @length -= 1
    @tail = head if length.zero?

    current
  end

  def clear
    @head = nil
    @length = 0
  end

  def empty?
    length.zero?
  end

  private

  attr_reader :tail
end

if __FILE__.include?($PROGRAM_NAME)
  queue = Queue.new
  items = ('a'..'f').to_a

  items.each { |item| queue.push(item) }
  node = queue.shift
  queue.clear

  puts node.value
end
