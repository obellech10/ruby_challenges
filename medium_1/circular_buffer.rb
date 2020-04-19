require 'pry'

# completed in 74 minutes but had to review how to raise exceptions. Got caught
# up trying to figure out how it works.

class CircularBuffer
  class BufferEmptyException < StandardError; end
  class BufferFullException < StandardError; end

  def initialize(buffer_size)
    @max_buffer = buffer_size
    @buffer = []
  end

  def read
    raise BufferEmptyException if @buffer.empty?
    @buffer.shift
  end

  def write(object)
    raise BufferFullException if buffer_full?
    @buffer << object if !buffer_full? && validate(object)
  end

  def clear
    @buffer.clear
  end

  def write!(object)
    @buffer.shift if buffer_full? && validate(object)
    write(object) if validate(object)
  end

private

  def validate(object)
    object != nil
  end

  def buffer_full?
    @buffer.size == @max_buffer
  end
end

# Data Structure of a fixed size and is connected end to end
# - Starts out empt
#
# Input: we are given the size the circular buffer
# Output: the oldest object in the buffer
# => methods
#     1. #write - adds object to the buffer. Location doesn't matter
#     1. #write! - replaces the oldest element in the buffer if buffer full,
#                  otherwise adds object to buffer
#     2. #read - returns the oldest element in the buffer, removing the element
#                from the buffer
#
# Explicit requirements
# => Raise BufferFullException if trying to #write to a buffer that is full
# => If buffer empty return BufferEmptyException
#
# Algorithm
# 1. create structure (array) of length determined by input
# 2. if method #write, insert object to buffer or raise exception if buffer is full
# 3. if method #read, return oldest element in the buffer or raise exception if
#    empty
# 4. if method #write!, if buffer full overwrite oldest element, otherwise add
#    object to buffer.
#
