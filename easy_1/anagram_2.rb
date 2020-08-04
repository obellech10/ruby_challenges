require 'pry'

class Anagram
  def initialize(target_word)
    @target_word = target_word.downcase
  end

  def match(canidates)
    canidates.select do |word|
      next if word.downcase == @target_word.downcase
      word.chars.map(&:downcase).sort == @target_word.chars.map(&:downcase).sort
    end
  end
end
