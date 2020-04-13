system 'clear'
require 'pry'

class SecretHandshake
  SECRETHANDSHAKE_KEY = {
    1000 => 'jump', 100 => 'close your eyes',
    10 => 'double blink', 1 => 'wink'
  }

  def initialize(code)
    @code = transform(code)
  end

  def commands
    reverse = @code > 10000
    number = reverse ? @code - 10000 : @code
    command_array = []
    SECRETHANDSHAKE_KEY.each do |key, value|
      command, number = number.divmod(key)
      command_array << value if command > 0
    end
    reverse ? command_array : command_array.reverse
  end

  def transform(code)
    if code.class == String
      return code.to_i unless code.match?(/\D+/)
      return 0 if code.match?(/\D+/)
    else
      convert_to_binary(code)
    end
  end

  def convert_to_binary(code)
    number = code
    binary_array = []
    loop do
      break if number == 0
      number, binary = number.divmod(2)
      binary_array.unshift(binary)
    end
    binary_array.join.to_i
  end

end
