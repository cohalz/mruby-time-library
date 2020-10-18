class Time
  RFC2822_DAY_NAME = [
    'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'
  ]

  RFC2822_MONTH_NAME = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
  ]

  def rfc2822
    s = sprintf('%s, %02d %s %0*d %02d:%02d:%02d ',
      RFC2822_DAY_NAME[wday],
      day, RFC2822_MONTH_NAME[mon-1], year < 0 ? 5 : 4, year,
      hour, min, sec)
    if utc?
      s += '-0000'
    else
      offset_min = utc_offset_min
      s += offset_min > 0 ? '+' : '-'
      s += sprintf('%02d%02d', offset_min.abs / 60, offset_min.abs % 60)
    end
  end
  alias rfc822 rfc2822

  def httpdate
    t = dup.utc
    sprintf('%s, %02d %s %0*d %02d:%02d:%02d GMT',
      RFC2822_DAY_NAME[t.wday],
      t.day, RFC2822_MONTH_NAME[t.mon-1], t.year < 0 ? 5 : 4, t.year,
      t.hour, t.min, t.sec)
  end

  def xmlschema(fraction_digits = 0)
    fraction_digits = fraction_digits.to_i
    s = sprintf('%0*d-%02d-%02dT%02d:%02d:%02d',
      year < 0 ? 5 : 4, year, mon, day, hour, min, sec)

    if fraction_digits > 0
      s += sprintf('.%0*d', 6, usec)[0..fraction_digits]
    end

    if utc?
      s += 'Z'
    else
      offset_min = utc_offset_min
      s += offset_min > 0 ? '+' : '-'
      s += sprintf('%02d:%02d', offset_min.abs / 60, offset_min.abs % 60)
    end
  end
  alias iso8601 xmlschema

  private
  def utc_offset_min
    utc_date = Time.utc(year, mon, day, hour, min, sec)
    (utc_date.to_i - to_i) / 60
  end
end
