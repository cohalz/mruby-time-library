assert('default') do
  time = Time.utc(2020, 10, 17)

  assert_equal('2020-10-17T00:00:00Z', time.xmlschema)
  assert_equal('2020-10-17T00:00:00Z', time.iso8601)
  assert_equal('Sat, 17 Oct 2020 00:00:00 GMT', time.httpdate)
  assert_equal('Sat, 17 Oct 2020 00:00:00 -0000', time.rfc2822)
  assert_equal('Sat, 17 Oct 2020 00:00:00 -0000', time.rfc822)
end

assert('at Australia/Eucla(+08:45)') do
  tmp_tz = ENV['TZ']
  ENV['TZ'] = 'Australia/Eucla'
  time = Time.local(2020, 10, 17)
  ENV['TZ'] = tmp_tz

  assert_equal('2020-10-17T00:00:00+08:45', time.xmlschema)
  assert_equal('2020-10-17T00:00:00+08:45', time.iso8601)
  assert_equal('Fri, 16 Oct 2020 15:15:00 GMT', time.httpdate)
  assert_equal('Sat, 17 Oct 2020 00:00:00 +0845', time.rfc2822)
  assert_equal('Sat, 17 Oct 2020 00:00:00 +0845', time.rfc822)
end

assert('at Pacific/Marquesas(-09:30)') do
  tmp_tz = ENV['TZ']
  ENV['TZ'] = 'Pacific/Marquesas'
  time = Time.local(2020, 10, 17)
  ENV['TZ'] = tmp_tz

  assert_equal('2020-10-17T00:00:00-09:30', time.xmlschema)
  assert_equal('2020-10-17T00:00:00-09:30', time.iso8601)
  assert_equal('Sat, 17 Oct 2020 09:30:00 GMT', time.httpdate)
  assert_equal('Sat, 17 Oct 2020 00:00:00 -0930', time.rfc2822)
  assert_equal('Sat, 17 Oct 2020 00:00:00 -0930', time.rfc822)
end

assert('in -500 B.C.') do
  time = Time.utc(-500, 10, 17)

  assert_equal('-0500-10-17T00:00:00Z', time.xmlschema)
  assert_equal('-0500-10-17T00:00:00Z', time.iso8601)
  assert_equal('Wed, 17 Oct -0500 00:00:00 GMT', time.httpdate)
  assert_equal('Wed, 17 Oct -0500 00:00:00 -0000', time.rfc2822)
  assert_equal('Wed, 17 Oct -0500 00:00:00 -0000', time.rfc822)
end

assert('Time#xmlschema fraction_digits') do
  time = Time.utc(2020, 10, 17, 0, 0, 0, 67890)

  assert_equal('2020-10-17T00:00:00.06789Z', time.xmlschema(5))
  assert_equal('2020-10-17T00:00:00.06789Z', time.iso8601(5))
end
