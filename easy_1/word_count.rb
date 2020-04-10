system 'clear'
require 'pry'

class Phrase
  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    word_hash = Hash.new(0)

    @phrase.scan(/\b[\w']+\b/).each do |word|
      word_hash[word.downcase] += 1
    end
    word_hash
  end
end
