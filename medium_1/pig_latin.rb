system 'clear'
require 'pry'

class PigLatin
  def self.translate(text)
    text.split(' ').map do |word|
      translate_word(word)
    end.join(' ')
  end

  def self.translate_word(word)
    pig_latin = []
    word.each_char.with_index do |char, idx|
      if char.match(/u/) && word[idx - 1] == 'q' ||
        char.match(/[xy]/) && word[idx + 1].match(/[aeiou]/)
        pig_latin << word[idx]
      elsif char.match(/[^aeiouxy]/)
        pig_latin << word[idx]
      elsif char.match(/[aeiouyx]/)
        pig_latin.unshift(word[idx..-1])
        break
      end
    end
    pig_latin.push('ay').join
  end

  # def self.translate(text)
  #   translate = text.split(' ')
  #   translate.map do |word|
  #     pig_latin = []
  #     word.each_char.with_index do |char, idx|
  #       if char.match(/u/) && word[idx - 1] == 'q' ||
  #         char.match(/[xy]/) && word[idx + 1].match(/[aeiou]/)
  #         pig_latin << word[idx]
  #       elsif char.match(/[^aeiouxy]/)
  #         pig_latin << word[idx]
  #       elsif char.match(/[aeiouyx]/)
  #         pig_latin.unshift(word[idx..-1])
  #         break
  #       end
  #     end
  #     pig_latin.push('ay').join
  #   end.join(' ')
  # end



end
