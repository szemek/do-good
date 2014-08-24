Time::DATE_FORMATS[:day] = lambda { |time| time.strftime("#{time.day.ordinalize} %B") }
Time::DATE_FORMATS[:time] = lambda { |time| time.strftime("%l:%M %P") }
