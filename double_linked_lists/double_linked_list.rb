# frozen_string_literal: true

require_relative 'node'
require 'pry-nav'

class DoubleLinkedList
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
      head.back = node
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
      node.back = tail
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

    if length.zero?
      @tail = head
    else
      head.back = nil
    end
    current
  end

  def pop
    return if length.zero?

    current = tail
    @tail = tail.back
    @length -= 1

    if length.zero?
      @head = tail
    else
      tail.next = nil
    end
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

  def reverse_each
    return unless block_given?

    current = tail
    while current
      yield(current)
      current = current.back
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
    return unless list.is_a?(DoubleLinkedList)

    tail.next = list.first
    list.first.back = tail
    @tail = list.last
    @length += list.size
  end
end

if __FILE__.include?($PROGRAM_NAME)
  list = DoubleLinkedList.new
  items = ('a'..'f').to_a
  elements = []

  items.each { |item| list.push(item) }
  list.reverse_each { |node| elements << node.value }
  list.clear

  puts elements.to_s
end
