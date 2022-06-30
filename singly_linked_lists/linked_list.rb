# frozen_string_literal: true

require_relative 'node'
require 'pry-nav'

class LinkedList
  attr_reader :head, :tail, :length

  alias first head
  alias last tail
  alias size length

  def initialize
    @length = 0
  end

  def unshift(item)
    node = Node.new(item)

    if head
      node.next = head
    else
      @tail = node
    end

    @head = node
    @length += 1
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

  def pop
    return if length.zero?

    current = head
    current = current.next until current == tail || current.next == tail
    @tail = current
    current = current.next if current.next
    tail.next = nil
    @length -= 1
    @head = @tail = nil if length.zero?

    current
  end

  def each
    return unless block_given?

    current = head
    while current
      yield(current)
      current = current.next
    end
  end

  def clear
    @head = nil
    @tail = nil
    @length = 0
  end

  def empty?
    length.zero?
  end

  def cat(list)
    return unless list.is_a?(LinkedList)

    tail.next = list.first
    @tail = list.last
    @length += list.size
  end
end

if __FILE__.include?($PROGRAM_NAME)
  list = LinkedList.new
  items = ('a'..'f').to_a
  elements = []

  items.each { |item| list.push(item) }
  list.each { |node| elements << node.value }
  list.clear

  puts elements.to_s
end
