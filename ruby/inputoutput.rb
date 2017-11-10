f = File.open("data.txt", "r")
out = File.open("out.txt", "w")

File.open("log.txt", "a") do |log|
  log.put("INFO: Logging a message")
end

uptime = open("|uptime"){|f| f.gets}

require "open-uri"
f = open("http://www.example.com")
webpage = f.read
f.close

require "stringio"
input = StringIO.open("now is the time")
buffer = ""
output = StringIO.open("buffer", "w")

f.set_encoding("iso-8859-1", "utf-8")
f.set_encoding("iso-8859-1:utf-8")
f.set_encoding(Encoding:UTF-8)

in = File.open("data.txt", "r:utf-8")
out = File.open("log", "a:utf-8")
in = File.open("data.txt", "r:iso-8859-1:utf-8")

lines = ARGV.readlines
line = DAT.readline
print 1 while 1 = DATA.gets
DATA.each{|line| print line}
DATA.each_line
DATA.lines

print while DATA.gets

DATA.lineno = 0
DATA.readline
DATA.lineno
$.

data = IO.read("read")
data = IO.read("data", 4, 2)
data = IO.read("data", nil, 6)
data = IO.read("data", mode:"rb")
data = IO.read("data", encoding:"binary")

words = IO.readlines("/usr/share/dict/words")

words = {}
IO.foreach("/usr/share/dict/words"){|w| words[w] = true}

IO.copy_stream("/usr/share/dict/words", STDOUT)
IO.copu_stream("/usr/share/dict/words", STDOUT, 10, 100)

f = File.read("data.txt")
text = f.read
f.close

f = File.open("data", "r:binary")
c = f.getc
f.ungetc(c)
c = f.readchar

f.each_byte{|b| ... }
f.bytes
f.each_char{|c| ... }
f.chars


f = File.open("data.bin", "rb:binary")
magic = f.readbytes(4)
exit unless magic == "INTS"
bytes = f.read


o = STDOUT
o.putc(65)
o.putc("B")
o.putc("CD")


o = STDOUT
o << x
o << x << y
o.print
o.print s
o.print s,t
o.print fmf,*args #*args --> %[args]
o.print x,y
o.print [x,y]
o.print s
o.syswrite s


f = File.open("test.txt")
f.pos
f.pos = 10
f.tell
f.rewind
f.seek(10, IO::SEEK_SET)
f.seek(10, IO::SEEK_CUR)
f.seek(-10, IO::SEEK_END)
f.seek(0, IO::SEEK_END)
f.eof?


pos = f.syseek(0, IO::SEEK_CUR)
f.syseek(0, IO::SEEK_SET)
f.syseek(pos, IO::SEEK_SET)

File.open("test.txt") do |f|
  #
end

begin
  f = File.open("test.txt")
  #
ensure
  f.close if f
end


out.print 'wait>'
out.flush
sleep(1)
out.sync = true
out.sync = false
out.sync
out.fsync

f.eof?
f.closed?
f.tty?