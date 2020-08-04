require 'pry'

class Series
  def initialize(string)
    @series = string.split('').map(&:to_i)
  end

  def slices(length)
    raise ArgumentError if length > @series.size

    @series.each_cons(length).map do |*slice|
      slice.flatten
    end
  end
end
