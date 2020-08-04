require 'pry'

class Phrase
  def initialize(phrase)
    @words = phrase.scan(/\w+'?\w|\d/).map(&:downcase)
    # @words = phrase.scan(/\b[\w']+\b/).map(&:downcase)
  end

  def word_count
    counts = Hash.new(0)
    @words.each do |word|
      counts[word] += 1
    end
    counts
  end
end

=begin
  - new instance is created with a string object that can represent a word or
  words. convert string to array and remove anything that is not a letter, number
  or apostrophe within a word
  - output: will be a hash that contains the words/numbers as keys and their
  occurrences as the value

  data structure:
  1. Array to hold string to evaluate
  2. hash to hold word and counts

  implicit requirements
  1. remove all punctuation from the string.
  2. case insensitive
  3. ignore quotations
  4. include words containing apostrophes
  5. remove whitespaces characters

  algorithm
  1. during initialization, cleanse incoming string object and convert to array
  2. create local variable and set it equal to a hash with default 0 value
  3. iterate through words array, set the word as the key for the hash if it
  doesn't already exist, if it does exist increment it's value by 1
  4. return the hash
=end
