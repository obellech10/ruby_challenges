require 'pry'

class BeerSong
  BEER_LYRICS = {
    0 => ["No more bottles of beer on the wall, no more bottles of beer.\n" \
          "Go to the store and buy some more, 99 bottles of beer on the wall.\n"],
    1 => ["1 bottle of beer on the wall, 1 bottle of beer.\n" \
          "Take it down and pass it around, no more bottles of beer on the wall.\n"],
    2 => ["2 bottles of beer on the wall, 2 bottles of beer.\n" \
          "Take one down and pass it around, 1 bottle of beer on the wall.\n"]
  }

  def verse(number)
    result = []
    if number > 2
      result << "#{number} bottles of beer on the wall, #{number} bottles of beer.\n" \
      "Take one down and pass it around, #{number - 1} bottles of beer on the wall.\n"
    else
      result << BEER_LYRICS[number]
    end
    result.join("\n")
  end

  def verses(start_verse, end_verse)
    result = []
    start_verse.downto(end_verse).each do |number|
      result << verse(number)
    end
    result.join("\n")
  end

  def lyrics
    verses(99, 0)
  end 
end

=begin
  create program that returns the requested verse from the song 99 bottles
  there will be 3 instance methods verse, verses, lyrics

  #verse
  Input: Integer that represents the verse number of the song
  Output: the verse with the amount of bottles of each line reflected by the
  input value given

  Data Structure:
  1. array that contains the verses to output
  2. hash that has the verse number as key and lyrics as values

  Algorithm
  1. create a local variable named result and set it equal to an empty array
  2. Take the method argument and determine if the number is greater than 2, if
  so have the default set of lyrics added to the result array
  3. if argument is less than or equal to 2, grab the verse from the lyrics hash
  4. join the result array elements with a new line and return the result array
=end
