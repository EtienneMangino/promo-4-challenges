# This "require" line loads the contents of the 'date' file from the standard
# Ruby library, giving you access to the Date class.
require 'date'


def age_in_days(day, month, year)
  # TODO: return the age expressed in days given the day, month, and year of birth
  date = Time.now.to_s

  actual_year = date[0..3].to_i
  actual_month = date[5..6].to_i
  actual_day = date[8..9].to_i

  days = (Date.new(actual_year,actual_month,actual_day) - Date.new(year,month,day)).to_i


end
