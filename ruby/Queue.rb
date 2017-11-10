a = [-2,-1,0,1,2]
mapper = lambda{|x| x*x }
injector = lambda{|total,x| total+x }
a.conject(0, mapper, injector)

module Enumerable
  def conject(intial, mapper, injector)
    q = Queue.new
	count = 0
	each do |item|
	Thread.new do
	  q.enq(mapper[item])
	end
	count += 1
  end
  
  t = Thread.new do
    x = intial
	while(count > 0)
	  x = injector[x,q, deq]
	  count -= 1
	end
	x
  end
  
  t.value
  end
end