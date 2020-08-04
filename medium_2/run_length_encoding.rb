require 'pry'

class RunLengthEncoding
  def self.encode(string)
    string.gsub(/(.)\1{1,}/) do |match|
      match.size.to_s + match[0]
    end
  end

  def self.decode(string)
    string.gsub(/\d+\D/) do |match|
      match[-1] * match.to_i
    end
  end
end
