require 'pry'

# Completed with the help of the solution video to get started and with help
# on the - method
class Clock
  def initialize(hour, minutes)
    @hour = hour
    @minutes = minutes
  end

  def self.at(hour, minutes=0)
    Clock.new(hour, minutes)
  end

  def to_s
    format('%02d:%02d', @hour, @minutes)
  end

  def +(min)
    @hour = (@hour + (min / 60)) % 24
    @minutes += (min % 60)

    self
  end

  def -(min)
    # self.+(-min)

    hour, minute = min / 60, min % 60
    @hour -= 1 if @minutes - minute < 0

    @hour = (@hour - hour) % 24
    @minutes = (@minutes - minute) % 60
    self
  end

  def ==(other)
    self.to_s == other.to_s
  end
end
