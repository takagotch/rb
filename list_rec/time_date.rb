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


require "date"
M060101 = Date.new(1873, 1, 1)
T010730 = Date.new(1912, 7, 30)
S011225 = Date.new(1926, 12, 25)
H010108 = Date.new(1989, 1, 8)

def jisx0301(date)
  if date >= H010108
    year = "S%02d" % (date.year - H010108.year + 1)
  elseif date >= S011225
    year = "S%02d" % (date.year - S011225.year + 1)
  elseif date >= T010730
    year = "T%02d" % (date.year - T010730.year + 1)
  else
    year = date.year.to_s
  end
  return "%s.%02d.%02d." % [year, date.month, date.day]
end

puts jisx0301(Date.new(1872, 12, 31))
puts jisx0301(Date.new(1873,  1,  1))
puts jisx0301(Date.new(1872,  7, 29))
puts jisx0301(Date.new(1872,  7, 30))
puts jisx0301(Date.new(1872, 12, 24))
puts jisx0301(Date.new(1872, 12, 25))
puts jisx0301(Date.new(1872,  1,  7))
puts jisx0301(Date.new(1872,  1,  8))



require "date"
JAPANESE_WDAY = %w(日 月 火 水 木 金 土)
day = Date.today
puts day
puts JAPANESE_WDAY[day.wday]


require "date"
require "date4/holiday" #http://www.funaba.org/ruby.html#date4
p Date4.new(2010, 1, 11).national_holiday?


require "date4"
require "date4/holiday"
today = Date4.today
d = Date4.today(today.year, today.month, 3, 1)
puts d.to_s


CelestiaStem = %w(0 0 0 0 0 0 0 0 0 0)
EarthlyBranch = %w(0 0 0 0 0 0 0 0 0 0)
def stem_and_branch(year)
  CelestialStem[year % 10] + EarthBranch[year % 12]
end
p stem_and_branch(1868)
p stem_and_branch(1966)


require "date"
birthdate = 19930224
today = Date.today
todaynum = today.year * 10000 + tosya.month * 100 +today.day
p todaynum
age = (todaynum - birthdate) / 10000
p age



require "date"
def billing_date(date, billing_days)
  dates = 
    billing_days.collect(|d| Date.new(date.year, date.month, d) )
  dates.sort!
  result = dates.find(|d| date <= d )
  return result if result
  next_dates = dates.collect{|d| d >> 1 }
  return next_dates.find{|d| date < d }
end
sime = [15, -1]
puts billing_date(Date.new(2017, 6, 14), sime)
puts billing_date(Date.new(2017, 6, 15), sime)
puts billing_date(Date.new(2017, 6, 16), sime)
puts billing_date(Date.new(2017, 6, 29), sime)
puts billing_date(Date.new(2017, 6, 30), sime)
puts billing_date(Date.new(2017, 7,  1), sime)




require"date"
d1 = Date.new(2017, 3,31)
p((d1 << 3).year)
d2 = Date.new(2017, 4, 1)
p((d2 << 3).year)

d1 - Date.new(2010, 10, 30)
p((d1 << -2).year)
d2 = Date.new(2017, 11, 1)
p((d2 << -2).year)


require "tempfile"
def long_time_t?
  t = Time.at(0x8000_0000)
  Tempfile.open("size_of_time_t") do |f|
    File.utime(t, t, f.path)
	raise unless File.mtime(f.path) == t
  end
  return true
rescue
  return false
end