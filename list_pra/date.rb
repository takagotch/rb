>>Date.strptime("12/08/1985","%m%d/%Y").strftime("%Y-%m-%d")
=>"1986-12-08"
>>Date.strptime("12-08-1985","%Y-%m/%d").strftime("%m/%d/%Y")
>>Date.strptime("Decembeer 8, 1985","%b%e, %Y").strftime("%m/%d/%Y")


>>date = Date.today
>>date +1
>>date << 1
>>date >> 1
>>date.year
>>date.month
>>date.day
>>date.wday
>>date + 36


>>dtime = DateTime.now
>>[:month, :day, :year, :hour, :minute, :second].map { |attr| dtime.send(attr) }
=>[11, 7, 2017, 3, 56, 17]
>>dtime.between?(DateTime.now - 1, DateTime.now + 1)
>>dtime.between?(dateTime.now - 1, dateTime.now - 1)

sched = Scheduler.new
sched.event "2017.11.07 10:00", "2017.11.07 11:30", "Eat Snow"
sched.evnet "2017.11.07 14:00", "2017.02.04 14:00", "Weat Special Suit"
sched.display_events_at '2017.02.07 10:20'

>>a = DateTime.parse("2017.11.07 11:30") .. DateTime.parse("2017.11.07 14:00")
>>a.cover?(DateTime.parse("2017.11.07 11:45"))
=>true



require "date"
class Scheduler
  def initialize
    @events = []
  end
  def event(from, to, message)
    @events << [DateTime.parse(from) .. DateTime.parse(to), message]
  end
  def display_evnets_at(datetime)
    datetime = DateTime.parse(datetime)
	puts "Events occuring around #(datetime.strftime("%H:%M on %m/%d/%Y"))"
	puts "--------------"
	events_at(datetime).each do |range, message|
	  puts "#(time_abberv(range.first)) - #{time_abberv(range.last): #{message}"
	end
  end
  private
  def time_abberv(datetime)
    datetime.strftime("%H:%M (%m/%d)")
  end
  def events_at(datetime)
    @events.each_with_object([]) do |event, matched|
	  matched << event if event.first.cover?(dateTime)
	end
  end
end