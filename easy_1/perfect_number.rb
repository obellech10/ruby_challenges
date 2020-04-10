require 'pry'
system 'clear'

class PerfectNumber

  def self.classify(number)
    raise RuntimeError if number <= 0

    divisors = (1..number-1).select { |num| number % num == 0 }

    aliquot = divisors.sum

    case
      when aliquot > number then 'abundant'
      when aliquot < number then 'deficient'
      when aliquot == number then 'perfect'
    end
  end

  # def self.classify(number)
  #   raise RuntimeError if number <= 0
  #
  #   divisors = self.calc_divisors(number)
  #
  #   self.aliquot(divisors, number)
  # end
  #
  # def self.calc_divisors(number)
  #   divisors = []
  #   1.upto(number - 1) do |num|
  #     divisors << num if number % num == 0
  #   end
  #   divisors
  # end
  #
  # def self.aliquot(array, number)
  #   aliquot = array.sum
  #
  #   if aliquot > number
  #     return 'abundant'
  #   elsif aliquot < number
  #     return 'deficient'
  #   elsif aliquot == number
  #     return 'perfect'
  #   end
  # end

end
