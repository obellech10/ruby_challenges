require 'pry'
system 'clear'

def reverse_odd_words(phrase)
  return phrase if phrase.empty?
  phrase.scan(/\w{1,20}/).map.with_index do |word, index|
    index.odd? ? word.reverse : word
  end.join(' ') << '.'
end


p reverse_odd_words("whats the matter with Kansas.") == 'whats eht matter htiw Kansas.'
p reverse_odd_words(" total sham  .") == 'total mahs.'
p reverse_odd_words(" total    sham  .") == 'total mahs.'
p reverse_odd_words("") == ''

=begin
  Input: string object that represents a sentence.
  Output: a string with the odd index value words being reversed

  Details:
  1. Words are 1-20 letters in length.
  2. Words will be separated by 1 or more spaces.
  3. Phrase will be terminated by a word followed by zero or more spaces and a
  period.
  4. Output will consist of words separated by one space, with odd index value
  words being reversed.
  5. The output string will be terminated immediately by a period after the last
  word.
=end
