require 'pry'

# Competed in 45 minutes
class School
  def initialize
    @school_register = Hash.new
  end

  def to_h
    # @school_register.values.map(&:sort!)
    # @school_register.sort.to_h
    @school_register.sort.map { |grade, students| [grade, students.sort]}.to_h
  end

  def add(student, grade)
    if @school_register[grade]
      @school_register[grade] += [student]
    else
      @school_register[grade] = [student]
    end
  end

  def grade(grade)
    @school_register.fetch(grade, [])
  end
end

=begin
  A program that stores student names and grade

  Methods:
    #add - add student to the list of grades and students
      input: given a string object representing student name & integer for grade
      output: none

    #grade - returns list of students
      input: integer representing the school grade
      output: an array of students from the input grade

    #to_h - returns a list of grades and students
      input: none
      output: an array, grades as keys, array of students as values

  Implict requirements
    - Return empty array if grade is not contained in school list

  Explicit requirements
    - School list should be sorted by grade number and students by alphabetical order

=end
