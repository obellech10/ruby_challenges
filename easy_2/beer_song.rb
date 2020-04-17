require 'pry'

# Completed in 60 minutes
class BeerSong
  def verse(verse_number)
    verses(verse_number, verse_number)
  end

  def lyrics
    verses(99, 0)
  end

  def verses(start_verse, end_verse=start_verse)
    lyrics = []
    counter = start_verse
    loop do
      case counter
      when 3..99 then
        lyrics << default_verse(counter)
      when 2 then
        lyrics << verse_2
      when 1 then
        lyrics << verse_1
      when 0 then
        lyrics << verse_0
      end
      break if counter == end_verse
      counter -= 1
    end
    lyrics.join("\n")
  end

private

  def default_verse(number)
    "#{number} bottles of beer on the wall, #{number} bottles of beer.\n" \
    "Take one down and pass it around," \
    " #{number - 1} bottles of beer on the wall.\n" \
  end

  def verse_2
    "2 bottles of beer on the wall, 2 bottles of beer.\n" \
    "Take one down and pass it around, 1 bottle of beer on the wall.\n"
  end

  def verse_1
    "1 bottle of beer on the wall, 1 bottle of beer.\n" \
    "Take it down and pass it around, no more bottles of beer on the wall.\n"
  end

  def verse_0
    "No more bottles of beer on the wall, no more bottles of beer.\n" \
    "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  end
end
