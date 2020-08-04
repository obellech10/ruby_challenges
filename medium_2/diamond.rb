require 'pry'

class Diamond
  def self.make_diamond(value)
    return "A\n" if value == "A"

    rows = []
    letter = "A"
    max_limit = ((value.ord - 64) * 2) - 1
    max_spaces = max_limit - 2
    spaces = 0
    
    loop do
      break if spaces > max_spaces
      if spaces == 0
        rows << letter.center(max_limit)
        spaces += 1
      elsif spaces < max_spaces
        rows << (letter + (" " * spaces) + letter).center(max_limit)
        spaces += 2
      else
        rows << (letter + (" " * spaces) + letter)
        spaces += 1
      end
      letter = letter.next
    end
    result = rows.concat(rows.take(max_limit / 2).reverse)
    result.join("\n") + "\n"
  end


end
