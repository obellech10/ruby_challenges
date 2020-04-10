require 'pry'
system 'clear'

def url?(string)
  string.match?(/\Ahttps?:\/\/\S+\z/)
end

puts url?('http://launchschool.com')   # -> true
puts url?('https://example.com')       # -> true
puts url?('https://example.com hello') # -> false
puts url?('   https://example.com')    # -> false
puts

def fields(text)
  text.split(/[ \t,]+/)
end

p fields("Pete,201,Student")
# -> ['Pete', '201', 'Student']

p fields("Pete \t 201    ,  TA")
# -> ['Pete', '201', 'TA']

p fields("Pete \t 201")
# -> ['Pete', '201']
puts

def mystery_math(text)
  text.sub(/[\+\-\*\/]/, '?')
end

puts mystery_math('4 + 3 - 5 = 2')
# -> '4 ? 3 - 5 = 2'

puts mystery_math('(4 * 3 + 2) / 7 - 1 = 1')
# -> '(4 ? 3 + 2) / 7 - 1 = 1'
puts

def mysterious_math(text)
  text.gsub(/[+\-*\/]/, '?')
end

puts mysterious_math('4 + 3 - 5 = 2')           # -> '4 ? 3 ? 5 = 2'
puts mysterious_math('(4 * 3 + 2) / 7 - 1 = 1') # -> '(4 ? 3 ? 2) ? 7 ? 1 = 1'
puts

def danish(text)
  text.sub(/\b(apple|blueberry|cherry)\b/, 'danish')
end

puts danish('An apple a day keeps the doctor away')
# -> 'An danish a day keeps the doctor away'
puts danish('My favorite is blueberry pie')
# -> 'My favorite is danish pie'
puts danish('The cherry of my eye')
# -> 'The danish of my eye'
puts danish('apple. cherry. blueberry.')
# -> 'danish. cherry. blueberry.'
puts danish('I love pineapple')
# -> 'I love pineapple'
puts

def format_date(date)
  date.gsub(/\A(\d{4})-(\d{2})-(\d{2})/, '\3.\2.\1')
      .gsub(/\A(\d{4})\/(\d{2})\/(\d{2})/, '\3.\2.\1')
end

puts format_date('2016-06-17') # -> '17.06.2016'
puts format_date('2017/05/03') # -> '03.05.2017'
puts format_date('2015/01-31') # -> '2015/01-31' (no change)
