Thread.new{
  #
}
#


def join_all
  main = Thread.main
  current = Thread.current
  all = Thread.list
  all.each{|t| t.join unless t == current or t == main }
end

Thread.abort_on_exception = true
t = Thread.new{ ... }
t.abort_on_exception = true


x = 0

t1 = Thread.new do
  #
end

t2 = Thread.new do
  #
end

n = 1
while n <= 3
  Thread.new{ puts n }
  n += 1
end


n = 1
while n <= 3
  Thread.new(n){|x| puts x }
  n += 1
end

total = 0
download_thread.each {|t| total += t[:progress] }

total = 0
download_thread.each{|t| total += t[:progress] if.key?(:progress)}