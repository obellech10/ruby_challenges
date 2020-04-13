system 'clear'
require 'pry'

class Luhn
  attr_accessor :number

  def initialize(number)
    @number = number.to_s.split('').map(&:to_i)
  end

  def addends
    index = -1
    result_array = []
    @number.reverse_each do |num|
      if index.even?
        digit_total = num * 2
        digit_total = digit_total >= 10 ? digit_total - 9 : digit_total
        result_array.unshift(digit_total)
      else
        result_array.unshift(num)
      end
      index -= 1
    end
    result_array
  end

  def checksum
    addends.sum
  end

  def valid?
    checksum % 10 == 0
  end

  def self.create(number)
    luhn = Luhn.new(number)
    0.upto 9 do |num|
      luhn.number << num

      if luhn.valid?
        return luhn.number.join.to_i
      else
        luhn.number.pop
      end
    end
  end
end
