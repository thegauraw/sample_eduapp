datetime_formats = {
  formatted_datetime: "%B %d, %Y @ %I:%M:%S %p"
}


Time::DATE_FORMATS.merge! datetime_formats
Date::DATE_FORMATS.merge! datetime_formats
