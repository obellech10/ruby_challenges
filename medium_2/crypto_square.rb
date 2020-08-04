require 'pry'

class Crypto
  def initialize(message)
    @message = message
  end

  def normalize_plaintext
    @message.scan(/\w/).map(&:downcase).join
  end

  def size
    Math.sqrt(normalize_plaintext.size).ceil
  end

  def plaintext_segments
    segments = []
    text = normalize_plaintext.split('')
    loop do
      break if text.empty?
      segments << text.shift(size).join
    end
    segments
  end

  def ciphertext
    encode_plaintext
    # cipher = ''
    # idx = 0
    # loop do
    #   break if idx > size
    #   plaintext_segments.each do |segment|
    #     cipher << segment[idx] unless segment[idx].nil?
    #   end
    #   idx += 1
    # end
    # cipher
  end

  def normalize_ciphertext
    binding.pry
    encode_plaintext(' ')
    # normal = []
    # output_size = Math.sqrt(ciphertext.size).floor
    # text = ciphertext.split('')
    # loop do
    #   break if text.empty?
    #   normal << text.shift(output_size).join
    #   # binding.pry
    # end
    # normal.join(' ')
  end

  def encode_plaintext(delimiter='')
    padded_segments = plaintext_segments.map do |string|
      right_pad(string, size)
    end
    binding.pry
    padded_segments.map(&:chars).transpose.map(&:join).map(&:strip).join(delimiter)
  end

  def right_pad(string, size_limit)
    string + ' ' * (size_limit - string.size)
  end
end

# segments = []
# text = ciphertext.split('')
# loop do
#   break if text.empty?
#   segments << text.shift(output_size).join
# end
# segments.join(' ')
