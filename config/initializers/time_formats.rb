# config/initializers/time_formats.rb
 Time::DATE_FORMATS[:nice_time] = "%b %d, %Y"
 Time::DATE_FORMATS[:comment_time] = "%m-%e-%y %H:%M"
 Time::DATE_FORMATS[:short_ordinal] = lambda { |time| time.strftime("%B #{time.day.ordinalize}") }
