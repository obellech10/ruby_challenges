require 'pry'

class DNA
  def initialize(orig_strand)
    @orig_strand = orig_strand.chars
  end

  def hamming_distance(strand)
    count = 0
    @orig_strand.zip(strand.chars).map(&:compact).each do |sub_array|
      next if sub_array.size < 2
      count += 1 if sub_array.first != sub_array.last
    end
    count
  end

end

=begin
  - new instance is created with a string object representing a DNA Strand of
  letters. this is the original strand
  - input for hamming_distance method is a string representing the comparison
  DNA strand used to calculate mutations.
  - output: integer that represents how many times the original DNA and commparison
  DNA differ, this is the hamming distance.

  data structure:
  1. Array for original DNA that holds each strands nucleotides
  2. Array for comparison strand that holds each strands nucleotides

  algorithm
  1. when creating new instance convert original DNA input to array of individual
  nucleotides
  2. conver hamming_distance argument to array of individual nucleotides
  3. #zip arrays and then use #compact to remove nil values
  4. create local variable count to track hamming distance
  5. iterate over each sub-array, comparing the 2 elments of each array, if not
  equal, increase count by 1. If sub-array size is equal to one skip evaluation
  of elements.
  6. return count
=end
