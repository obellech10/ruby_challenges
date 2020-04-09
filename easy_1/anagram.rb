require 'pry'

class Anagram
  def initialize(given_word)
    @given_word = given_word.downcase
  end

  def match(array)
    array.select do |word|
      if word.size == @given_word.size && word.downcase != @given_word
        word.downcase.chars.sort == @given_word.chars.sort
      end
    end
  end
end
