require 'pry'

class WordProblem
  OPERATORS = {
    'plus' => '+',
    'minus' => '-',
    'multiplied' => '*',
    'divided' => '/'
  }

  def initialize(string)
    # @words = string.gsub(/\?/, '').split(' ')
    @numbers = string.scan(/-?\d+/).map(&:to_i)
    @operators = string.scan(/plus|minus|divided|multiplied/)
  end

  def answer
    @operators.each_with_index.reduce(@numbers.first) do |result, (operator, idx)|
      binding.pry
      result.send OPERATORS[operator], @numbers[idx + 1]
      binding.pry
    end
  end
end

=begin
  Given a string of text that contains mathmatical problems written in words
  return the answer to the problem as an integer

  Data Structure
    - Array to store words and to read through each word to determine action to
    be taken
    - Hash containing the methods corresponding to the word actions,
    i.e. 'plus' => +

  Algorithm
  - remove ? from the string, then split the string into an array.
  - iterate over array, transforming words to either methods or integers
  - use send to get result of integers and methods


=end
