require 'pry'

class SimpleLinkedList
  def initialize
    @list = []
  end

  def size
    @list.size
  end

  def empty?
    @list.empty?
  end

  def push(element)
    if size == 0
      @list.push(Element.new(element))
    else
      @list.push(Element.new(element, @list[-1]))
    end
  end

  def peek
    # using the safe navigation operator,
    # so as to not call #datum on a nil object
    @list[-1]&.datum
  end

  def head
    @list[-1]
  end

  def pop
    @list&.pop&.datum
  end

  def self.from_a(collection)
    list = SimpleLinkedList.new
    collection&.reverse_each do |item|
      list.push(item)
    end
    list
  end

  def to_a
    @list.reverse.map { |element| element.data }
  end

  def reverse
    data = to_a.reverse
    SimpleLinkedList.from_a(data)
  end
end

class Element
  attr_reader :data

  def initialize(data, next_element=nil)
    @data = data
    @pointer = next_element
  end

  def datum
    @data
  end

  def tail?
    @pointer.nil?
  end

  def next
    @pointer
  end
end
