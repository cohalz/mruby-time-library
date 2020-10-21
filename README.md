# mruby-time-library

[![Build and Test](https://github.com/cohalz/mruby-time-library/workflows/Build%20and%20Test/badge.svg)](https://github.com/cohalz/mruby-time-library/actions?query=workflow%3A%22Build+and+Test%22)

[time](https://ruby-doc.org/stdlib-2.7.2/libdoc/time/rdoc/index.html) Library for mruby.

```ruby
p Time.utc(2020, 10, 17).xmlschema
#=> "2020-10-17T00:00:00Z"
p Time.utc(2020, 10, 17).httpdate
#=> "Sat, 17 Oct 2020 00:00:00 GMT"
p Time.utc(2020, 10, 17).rfc2822
#=> "Sat, 17 Oct 2020 00:00:00 -0000"
```

## Implemented methods

| method | implemented |
| - | - |
| Time#httpdate | o |
| Time#iso8601 | o |
| Time#rfc2822 | o |
| Time#rfc822 | o |
| Time#xmlschema | o |
| Time.httpdate | - |
| Time.iso8601 | - |
| Time.rfc2822 | - |
| Time.rfc822 | - |
| Time.strptime | - |
| Time.xmlschema | - |
| Time.zone_offset | - |
