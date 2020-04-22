require 'pry'

class Palindromes
  def initialize(factors)
    @max_factor = factors[:max_factor]
    @min_factor = factors[:min_factor] || 1
    # set up the structure how the test is asking for the data.
    @palindromes = Hash.new { |hash, key| hash[key] = [] }
  end

  def generate
    (@min_factor..@max_factor).to_a.repeated_combination(2) do |min, max|
      @palindromes[min * max] << [min, max] if palindrome?(min * max)
    end

  end

  def largest
    Struct.new(:value, :factors)
          .new(largest_palindrome, @palindromes[largest_palindrome])
  end

  def smallest
    Struct.new(:value, :factors)
    .new(smallest_palindrome, @palindromes[smallest_palindrome])
  end

private

  def palindrome?(value)
    value.to_s == value.to_s.reverse
  end

  def largest_palindrome
    @palindromes.keys.max
  end

  def smallest_palindrome
    @palindromes.keys.min
  end
end
