
class Cipher
  def self.rotate(text, key)
    # binding.pry

    text.each_char.reduce('') do |result, char|
      result + decipher(char, key)
    end

  end

  def self.decipher(char, key)
    if char == 'a'..'z'
      rotation = char.ord + key
      if rotation > 122
        mod_key = rotation - 122
        (char.ord + mod_key).chr
      else
        # binding.pry
        (char.ord + key).chr
      end
    elsif char == 'A'..'Z'
      rotation2 = char.ord + key
      if rotation2 > 90
        mod_key = rotation2 - 122
        (char.ord + mod_key).chr
      else
        (char.ord + key).chr
      end
    else
      char
    end

  end
