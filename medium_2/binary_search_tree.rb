require 'pry'

class Bst
  attr_reader :left, :right, :node

  def initialize(node)
    @node = node
  end

  def data
    @node
  end

  def insert(node)
    # new_node = Bst.new(node) # Code was creating a new object regardless if it
                               # was being used. Moved creation of new object to
                               # within the condition statement.
    if node <= @node
      # self.left.nil? ? @left = new_node : @left.insert(node)
      self.left.nil? ? @left = Bst.new(node) : @left.insert(node)
    elsif node > @node
      # self.right.nil? ? @right = new_node : @right.insert(node)
      self.right.nil? ? @right = Bst.new(node) : @right.insert(node)
    end
  end

  def each(&block)
    return self.to_enum unless block_given?

    # Using safe navigation operator, it avoids errors when a method is called
    # on a nil object. If object is nil, the method does not get called. Return
    # value is nil. 
    left&.each(&block)
    block.call(node)
    right&.each(&block)
  end
end
