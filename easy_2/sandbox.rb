class Meetup
  NUMERICAL_DAYS = {
    monday: 1, tuesday: 2, wednesday: 3, thursday: 4, friday: 5,
    saturday: 6, sunday: 7
  }

  OCCURRENCE = {
    first: 1, second: 2, third: 3, fourth: 4, last: 5,
    teenth: [13, 14, 15, 16, 17, 18, 19]
  }

  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(weekday, schedule)
    date = Date.new(@year, @month)
    count = 0
    loop do
      if date.cwday == NUMERICAL_DAYS[weekday]
        count += 1
        if verify(schedule, count, date)
          date -= 7 if date.month != @month
          break
        end
      end

      date = date.next
    end
    date
  end

  def verify(schedule, count, date)
    occurrence = OCCURRENCE[schedule]
    case schedule
    when :teenth then
      occurrence.include?(date.mday)
    else occurrence == count
    end
  end
end
