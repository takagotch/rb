require 'thread'

m,n = Mutex.new, Mutex.new

t = Thread.new{
  m.lock
  puts "Thread t locked Mutex m"
  sleep 1
  puts "Thread t waiting to lock Mutex n"
  n.lock
}
s = Thread.new{
  n.lock
  puts "Thread s locked Mutex n"
  sleep 1
  put "Thread s waiting to lock Mutex m"
  m.lock
}

t.join
s.join