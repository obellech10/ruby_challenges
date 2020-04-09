require 'pry'

class DNA
  def initialize(org_strand)
    @org_strand = org_strand.chars
  end

  def hamming_distance(strand)
    org_array, comp_array = prep_data(@org_strand.clone, strand.chars)
    hamming_distance = 0
    org_array.each_with_index do |char, index|
      hamming_distance += 1 if char != comp_array[index]
    end
    hamming_distance
  end

  def prep_data(array1, array2)
    if strands_equal?(array1, array2)
      return array1, array2
    else
      shorten_strands(array1, array2)
    end
  end

  def strands_equal?(array1, array2)
    array1.size == array2.size
  end

  def shorten_strands(array1, array2)
    difference = array1.size - array2.size
    if difference > 0
      array1 = array1.take(array1.size - difference)
    elsif difference < 0
      array2 = array2.take(array2.size + difference)
    end
    return array1, array2
  end
end
