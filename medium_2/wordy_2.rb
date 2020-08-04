require 'pry'

class WordProblem
  OPERANDS = {
    'plus' => :+,
    'minus' => :-,
    'multiplied' => :*,
    'divided' => :/
  }

  def initialize(question)
    @question = question.scan(/-?\w+/)
  end

  def answer
    operands = []
    numbers = []
    @question.each do |element|
      numbers << element.to_i if element.to_i.to_s == element
      operands << OPERANDS[element] if OPERANDS[element]
    end

    raise ArgumentError if operands.empty? || numbers.empty?

    operands.each_with_index.reduce(numbers.first) do |result, (operand, idx)|
      result.send operand, numbers[idx + 1]
    end
  end
end

=begin
  create an instance method that takes a written math problem and solves it.
  Input: A string that represents a written math problem, that consists of words
  and numbers
  Output: An integer that represents the result of the math problem inputted

  Explicit Requirements:
  1. calculate the answer as you move from left to right, this does not follow
  the normal mathmatical order of operations
  2. Use the send method within solution to help solve the problem elegantly

  Data Structure:
  1. Array to hold the word problem input after splitting the string
  2. Hash as a key to look up which mathmatical operation to apply

  Algorithm:
  1. during initialization convert question argument into an array of words
  2. Create local variables, operands & numbers , set them equal to empty arrays
  3. iterate through question array, if the element is a number, add it to
  numbers array. If matches an operation from operations hash, add operand
  method as symbol to operands array
  4. iterate through numbers array, sending the operand at the same index value
  of the number using the #send method. Store result of send to result array.
  5. Return result array
=end
