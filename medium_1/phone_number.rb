require 'pry'

# Completed in 53 minutes
class PhoneNumber
  INVAlID_NUMBER = '0000000000'

  def initialize(phone_number)
    @phone_number = phone_number
  end

  def number
    return INVAlID_NUMBER unless valid?(@phone_number)
    number = @phone_number.scan(/\d/)
    number.shift if number.size == 11
    number.join('')
  end

  def area_code
    number.match(/\d{3}/).to_s
  end

  def to_s
    digits = number
    "(#{digits[0..2]}) #{digits[3..5]}-#{digits[6..9]}"
  end

  def valid?(number)
    return false if number.match?(/[a-z]/i)

    number_array = number.scan(/\d/)
    return false if number_array.size < 10
    return false if number_array.size > 11
    return true if number_array.size == 10
    return true if number_array.size == 11 && number_array.first == '1'
  end
end
