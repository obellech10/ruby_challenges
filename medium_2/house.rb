require 'pry'

class House
  VERSE_START = 'This is '

  def self.recite
    new.recite
  end

  def recite
    lyrics = pieces
    offset = 11
    rhyme = []

    12.times do |line|
      verse = (VERSE_START + lyrics[line][0] + "\n")
      index = line

      rhyme.unshift(get_verse(verse, offset, lyrics, index))
      offset -= 1
    end
    rhyme.join("\n")
  end

  private

  def get_verse(verse, offset, lyrics, index)
    offset.times do
      verse_line = lyrics[index][1] + ' ' + lyrics[index+1][0] + "\n"
      verse.concat(verse_line)
      index += 1
    end
    verse
  end

  def pieces
    [
      ['the horse and the hound and the horn', 'that belonged to'],
      ['the farmer sowing his corn', 'that kept'],
      ['the rooster that crowed in the morn', 'that woke'],
      ['the priest all shaven and shorn', 'that married'],
      ['the man all tattered and torn', 'that kissed'],
      ['the maiden all forlorn', 'that milked'],
      ['the cow with the crumpled horn', 'that tossed'],
      ['the dog', 'that worried'],
      ['the cat', 'that killed'],
      ['the rat', 'that ate'],
      ['the malt', 'that lay in'],
      ['the house that Jack built.']
    ]
  end
end
