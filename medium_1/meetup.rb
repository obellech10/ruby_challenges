require 'pry'
require 'date'

# Completed in 2 hours (1st attempt)
# class Meetup
#   NUMERICAL_DAYS = {
#     monday: 1, tuesday: 2, wednesday: 3, thursday: 4, friday: 5,
#     saturday: 6, sunday: 7
#   }
#
#   OCCURRENCE = {
#     first: 1, second: 2, third: 3, fourth: 4, last: 5,
#     teenth: [13, 14, 15, 16, 17, 18, 19]
#   }
#
#   def initialize(month, year)
#     @month = month
#     @year = year
#   end
#
#   def day(weekday, schedule)
#     date = Date.new(@year, @month)
#     count = 0
#     loop do
#       if date.cwday == NUMERICAL_DAYS[weekday]
#         count += 1
#         if verify(schedule, count, date)
#           date -= 7 if date.month != @month
#           break
#         end
#       end
#
#       date = date.next
#     end
#     date
#   end
#
#   def verify(schedule, count, date)
#     occurrence = OCCURRENCE[schedule]
#     case schedule
#     when :teenth then
#       occurrence.include?(date.mday)
#     else occurrence == count
#     end
#   end
# end

# 2nd attempt completed in less time but with the aide of reviewing
# Launch School solution.
class Meetup
  OCCURRENCE = {
    first: 1,
    second: 8,
    third: 15,
    fourth: 22,
    last: -7,
    teenth: 13
  }

  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(weekday, schedule)
    date = Date.new(@year, @month, OCCURRENCE[schedule])
    (date..(date + 6)).find { |day| day.public_send(weekday.to_s + '?') }
  end

end

=begin
  a program that for a given month and year, can calculate the date of when the
  first occurence of a specified weekday occurs i.e. first Monday, second Friday
  teenth Tuesday.

  Methods:
    #day - determine first day given parameters of weekday and timeframe
      input: weekday, timeframe i.e. first, second, teenth etc
      output: date of occurence

  Algorithm:
    1. starting at the first of the month, iterate over each day
    2. if the day is equal to weekday given and is equal to the occurence
    return date
=end
