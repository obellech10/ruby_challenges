require 'pry'
system 'clear'

# Completed in 35 minutes
def reverse_odd_words(text)
  return text if text.empty?
  text.scan(/\b\w{1,20}\b/).map.with_index do |word, index|
    index.odd? ? reverse(word) : copy(word)
  end.join(' ').concat('.')
end

def reverse(word)
  word.chars.reverse.map { |letter| letter }.join
end

def copy(word)
  word.chars.map { |letter| letter }.join
end

p reverse_odd_words("whats the matter with Kansas.") == 'whats eht matter htiw Kansas.'
p reverse_odd_words(" total sham  .") == 'total mahs.'
p reverse_odd_words(" total    sham  .") == 'total mahs.'
p reverse_odd_words("") == ''
