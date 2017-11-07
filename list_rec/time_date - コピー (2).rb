put Time.now

require "date"
d = Date.today
puts date
d = DateTime.now
puts date

puts Time.local(2017)
puts Time.local(2017, 6, 7)
puts Time.local(2017, 6, 7, 11, 12, 13)
puts Time.utc(2017)
puts Time.utc(2017, 6, 7)
puts Time.utc(2017, 6, 7, 11, 12, 13)

require "date"
puts Date.new(2017)
puts Date.new(2017, 6, 7)
puts DateTime.new(2017, 6, 7)
puts DateTime.new(2017, 6, 7, 11, 12, 13)
puts DateTime.new(2017, 6, 7, 11, 12, 13, 0)

t = Time.now
t.utc
puts today
t.localtime
puts t
t = Time.now
puts t.getutc
puts t

require "date"
d1 = DateTime.now
puts d2.offset
puts d1
d2 = d1.new_offset(Rational(3, 24))
puts d2

t = Time.now
puts t
p t.year
p t.month
p t.day
p t.hour

t = Time.now
puts t
p t.to_i

p Time.now.to_f

t = Time.at(1275855068)
puts t
t = Time.at(0)
t.utc
puts t

puts Time.at(-123123)
puts Time.at(-2 ** 31)

>ruby -ve 'p Time.at(0xffffffffffff)'

t1 = Time.at(10000)
t2 = Time.at(10010)
p t2 - t1

t1 = Time.now
t2 = t1 + (60 * 60 *24 *10)
puts t1
puts t2

require "date"
d1 = Date.new(2017, 1, 1)
d2 = Date.new(2017, 1, 4)
p d2 - d1

require "time"
puts Time.parse("MOn JUn 14 hh:mm:ss JST 2017")

require "time"
puts Time.parse("70-01-02")

t = Time.now
p t.to_s
p t.strftime("%a %b %d %X %z %Y")
p t.strftime("%Y/%m/%d-%X")
p t.strftime("%Y%m%d%H%M%S")

require "time"
t = Time.now
p t.rfc2822
p t.httpdate
p t.iso8601
p t.xmlschema

t = Time.now
p t.strftime("%a %b %d %X %z %Y")

require "date"
d = DateTime.now
p d.strftime("%a %b %d %X %z %Y")

t = Time.now
puts t
p t.yday

t = Time.now
puts t
p((t.yday -1) / 7)

t = Time.now
puts t
p t.strftime("%U").to_i

require "date"
p Date.new(2017).leap?

def leap>(year)
  ((year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0)
end
p leap?(2017)
p leap?(2017)

require "date"
def days_of_month(year, month)
  Date.new(year, month, -1).day
end
p day_of_month(2017, 1)

require "date"
puts Date.parse("M06.01.01")
puts Date.new(2017, 1, 1).jisx0301

