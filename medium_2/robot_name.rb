require 'pry'

class Robot
  attr_reader :name

  @@robot_names = []

  def initialize
    @name = generate_name
    @@robot_names << @name
  end

  def generate_name
    new_name = ''
    loop do
      new_name = ('AA'..'ZZ').to_a.sample + (100..999).to_a.sample.to_s
      break unless duplicate?(new_name)
    end
    new_name
  end

  def reset
    @name = generate_name
  end

  def duplicate?(name)
    @@robot_names.include?(name)
  end
end
