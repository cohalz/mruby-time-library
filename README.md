# mruby-time-library

[time](https://ruby-doc.org/stdlib-2.7.2/libdoc/time/rdoc/index.html) Library for mruby.

```ruby
p Time.utc(2020, 10, 17).xmlschema
#=> "2020-10-17T00:00:00Z"
p Time.utc(2020, 10, 17).httpdate
#=> "Sat, 17 Oct 2020 00:00:00 GMT"
p Time.utc(2020, 10, 17).rfc2822
#=> "Sat, 17 Oct 2020 00:00:00 -0000"
```

## Notice of Implemented & Not Implemented
### Implemented
#### Public Instance Methods
- Time#httpdate
- Time#iso8601
- Time#rfc2822
- Time#rfc822
- Time#iso8601

### Not Implemented

#### Public Class Methods

- Time.httpdate
- Time.iso8601
- Time.parse
- Time.rfc2822
- Time.rfc822
- Time.strptime
- Time.xmlschema
- Time.zone_offset
