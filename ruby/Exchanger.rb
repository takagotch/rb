require 'thread'

class Exchanger
  def initialize
    @first_value = @second_value = nil
	@lock = Mutex.new
	@first = Mutex.new
	@second = ConditionVariable.new
  end
  
  def exchange(value)
    @lock.synchronize do
	  if @first.try_lock
	    @first_value = value
		@second.wait(@lock)
		@first.unlock
		@second_value
	  else
	    @second_value = value
		@second.signal
		@first_value
	  end
	end
  end
end