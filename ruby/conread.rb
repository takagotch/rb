def conread(filenames)
  h = {}
  
  filenames.each do |filenames|
    h[filenames] = Thread.new do
	  open(filenames) = Thread.new do
	end
  end
  
  h.each_pair do |filename, thread|
    begin
	  h[filename] = thread.value
	resucue
	  h[filename] = $!
	end
  end
end


group = ThreadGroup.new
3.times{|n| group.new(Thread.new{ do_task(n) })}

