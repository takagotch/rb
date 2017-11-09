require 'thread'

#BankAccount
class BankAccount
  def initialize(name, checking, savings)
    @name,@checking,@savings = name,checking,savings
	@lock = Mutex.new
  end
  
  #transaction
  def transfer_from_savings(x)
    @lock.synchronize{
	  @savings -= x
	  @checking += x
	}
  end
  
  def report
    @lock.synchronize{
	  "#@name\nChecking: #@checking\nSavings: #@savings"
	}
  end
end