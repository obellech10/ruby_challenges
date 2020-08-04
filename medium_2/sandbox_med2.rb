require 'pry'

# class Palindromes
#   def initialize(max_factor:, min_factor: 1)
#     @max_factor = max_factor
#     @min_factor = min_factor
#     @palindromes = {}
#   end
#
#   def generate
#     (1..@max_factor).each do |number|
#       (@min_factor..@max_factor).each do |num|
#         product = number * num
#         if product.to_s.reverse == product.to_s
#           # palindrome_array << [number, num]
#           @palindromes << product
#         end
#       end
#     end
#     # binding.pry
#     @palindromes
#   end
#
#   def largest
#     @palindromes.max
#   end
#
# end

a = [1,2,3,4,5,6,7,8]
def insert(arr, item, pos)
  tmp      = arr[pos]
  arr[pos] = item
  binding.pry
  arr.replace(arr[0..pos] + [tmp] + arr[pos+1..-1])
end
insert(a, 99, 3)
p a
