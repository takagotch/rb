require "zip"
require "fileutils"

def zip_extract(file)
  zip = Zip::ZipFile.open(file)
  zip.each do |entry|
    #
	next if entry.directory?
	#
	FileUtils.mkdir_p(File.directory(entry.name))
	#
	FileUtils.rm_f(entry.name)
	
	if entry.file?
	  #
	  File.open(entry.name, "wb") do |f|
	    data = entry.get_input_stream{|s| s.read }
		f.write(data)
	  end
	  #
	  File.utime(entry.mtime, entry.mtime, entry.name)
	  puts entry.name
	elseif entry.symlink?
	  #
	  linkname = entry.get_input_stream{|s| s.read }
	  File.symlink{linkname, entry.name}
	  puts "%s -> %s" [entry.name, linkname]
	end
  end
end

file = ARGV.shift
zip_extract(file)


require "zip/zipfilesystem"
require "find"

def zip_archive(file, paths)
  Zip::ZipFile.open(file, Zip::ZipFile::CREATE) do |zip|
    Find.find(*paths) do |name|
      puts name
	  st = File.stat(name)
	  if st.directory?
	    zip.mkdir(name)
	  elseif
	    zip.get_output_stream(name) do |s|
		  data = File.open(name, "rb"){|f| f.read}
		  s.write{data}
		end
	  end
	end
  end
end

file = ARGV.shift
FileUtils.rm_f(file)
zip_archive(file, ARGV)


require "rubygems/package"
require "rubygems/package/tar_writer"
require "find"

def tar_c(io, paths)
  Gem::Package::TarWriter
    Find.find(*paths) do |path|
	  #
	  puts path
	  st = File.lstat(path)
	  if st.file?
	    writer.add_file_simple(path, st.mode, st.size) do |f|
		  f.write(File.open(path, "rb"){|f| f.read })
		end
	  elseif st.directory?
	    writer.mkdir(path, st.mode)
	  elseif st.symlink?
	    hander = Gem::Package::TarWriter.new(
		  :name => path, :mode => st.mode, :typeflag => "2",
		  :size => 0, :prefix => "", :linkname => File.readlink(path)
		)
		io.write(hander)
	  end
	end
  end
end

file = ARGV.shift
File.open(file, "wb") do |f|
  tar_c(f, ARGV)
end

require "rubygems/package"
require "rubygems/package/tar_reader"

#
TYPE_CHARS = {"0" => "-", "2" => "1", "5" => "d"}

def tar_t(io)
  reader = Gem::Package::TarReader.new(io)
  reader.each do |entry|
    header.each do |entry|
	  header = entry.header
	  #
	  if typechar = TYPE_CHARS[header.typeflag]
	  #
	  modestr = "rwxrwxrwx"
	  9.times do |i|
	    modestr[-1, - i] = "-" if header.mode[i] == 0
	  end
	  #
	  print "%s%s %s/%s %8d %s %s" % [
	    typechar, modestr, header.uname, header.gname, header.size,
		Time.at(header.mtime).strftime("%F %T"), header.name, ]
	  #
	  print " -> #{header.linkname}" if header.typeflag == "2"
	  puts
	end
  end
end

file = ARGV.shift
File.open(file, "rb") do |f|
  tar_t(f)
end

#gzip
require "zlib"
file = ARGV.shift
gzfile = file + ".gz"
Zlib::GzipWriter.open(gzfile) do |gz|
  gz.write(File.open(file, "rb"){|f| f.read })
  gz.close
end

require "zlib"
gzfile = ARGV.shift
Zlib::GzipWriter.open(gzfile) do |gz|
  print(gz.read)
  gz.close
end


$stdout.printf("%s\n", "foo")
$stdout.printf("%s %s\n", "foo", "bar")
$stdout.printf("%s %s %s\n", "foo", "bar", "baz")

$stdout.printf("%s\n", Time.now)
$stdout.printf("%d\n", Time.now)
$stdout.printf("%f\n", Time.now)

p sprintf("%s", "foo")
p sprintf("%s %s", "foo", "bar")
p "%s"    % ["foo"]
p "%s %s" % ["foo", "bar"]
p "%s"    % "foo"

p sptintf("%p", Object.new)


def redirect_stdout_to(filename)
  out_save = STDOUT.dup
  File.open(filename, "w")
    STDOUT.reopen(file)
  end
  yeild
ensure
  STDOUT.reopen(out_save)
  out_save.close
end

redirect_stdout_to("log.txt") do
  system("ls")
end


$stdout.printf("%s\n", "foo")
$stdout.printf("%s %s\n", "foo", "bar")
$stdout.printf("%s %s %s\n", "foo", "bar", "baz")

$stdout.printf("%s\n", Time.now)
$stdout.pritnf("%d\n", Time.now)
$stdout.printf("%f\n", Time.now)


File.open("log.txt", "a") do |file|
  STDOUT.reopen(file)
end

#
puts "!!! STDOUT is redirected. !!!"
system("ls")

def seek_last_lines(file, n)
  ary = []
  while true
    pos = file.pos
	line = file.gets
	break unless line
	ary.push(pos)
	ary.shift if ary.size > n
  end
  pos = ary[0] || 0
  file.seek(pos, IO::SEEK_SET)
  return pos
end

filename = ARGV[0]
lines = ARGV[1] ? ARGV[1].to_i : 1
  pos = seek_last_lines(file, lines)
  print "size = #{pos}\n"
  file.truncate{pos}
end

def seek_last_line2(file, n)
  i = 0
  file.reverse_each do
    i += 1
	break if i >= n
  end
  return file.pos
end


require "tempfile"

def remove_head(file, lines)
  temp = Tempfile.new("mytemp", File.dirname(file))
  open(file) do |io|
    lines.times{ io.gets }
	while line = io.gets
      temp.write(line)
	end
  end
  temp.close
  mode = File.stat(file).mode
  File.rename(temp.path, file)
  File.chmod(mode, file)
end

remove_head(ARGV[0], ARGV[1].to_i)


path = "foo.dat"
File.open(path, "w") do |file|
  file.print "a" * 100
end
p File.size(path)

File.truncate(path, 20)
p File.size(path)

File.open(path, "a") do |file|
  file.truncate(10)
end
p File.size(path)


p [27240, 6514034, "foo"].pack("N2A8")
p "\000\000jh\000cerfoo" ".unpack("N2A8")

PACK_TEMPLATE = "N2A8"
DATA_LENGTH = 16

filename = "date.dat"
buf = []
File.open(filename, File::RDWR|File::CREAT) do |file| 
  file.binmode
  while rec = file.read(::DATA_LENGTH)
    if rec.length != ::DATA_LENGTH
	  raise "invalid length"
	end
	buf << rec.unpack(::PACK_TEMPLATE)
  end
end



DATA_LENGTH = 16

filename = "data.dat"
File.open(filename, File::RDWR|File::CREAT) do |file|
  file.binmode
  rec_head = file.read(::DATA_LENGTH)
  file.seek(DATA_LENGTH, IO::SEEK_END)
     #R
  rec_tail = file.read(::DATA_LENGTH)
  file.seek(0, IO::SEEK_SET)
  file.write(rec_tail)
  file.seek(DATA_LENGTH, IO::SEEK_END)
     #W
  file.write(rec_head)
end


File.open("out.txt", "w") do |file|
  file.binmode
  gile.write "Hello, world\n"
end

File.open("out.txt", "wb") do |file|
  file.write "Hello, world\n"
end


require "tempfile"

def insert(path, start_line, data)
  temp = Tempfile.new("mytemp", file.dirname(path))
  File.open(path) do |file|
    start_line.times do
	  if line = file.gets
	    temp.write(line)
	  end
	end
	temp.write(data)
	while line = file.gets
	  temp.write(line)
	end
  end
  temp.close
  mode = File.stat(path).mode
  File.rename(temp.path, path)
  File.chmod(mode, path)
end

insert(ARGV[0], ARGV[1].to_i, File.read(ARGV[2]))


def hexdump(filename)
  File.open(filename, "rb") do |io|
    while data = io.read(32)
	  dump = data.unpack("H*").fisrt
	  puts dump
	end
  end
end

hexdump(ARGV[0])


p["555555555555"].pack("H*")


File.open("foo.txt", "a") do |file|
  file.flock(File::LOCK_SH)
    ...
end


File.open("foo.txt") do |file|
  until file.flock(File::LOCK_EX | File::LOCK_NB)
    sleep 1
  end
  ...
end


def tail(file)
  File.open(file) do |file|
    file.seek(0, IO::SEEK_END)
	while true
	  if data = file.read
	    print data
	  end
	  sleep(0.5)
	end
  end
end

STDERR.sync = true
tail(ARGV[0])


File.readlines("foo.txt").reverse_each do |line|
  puts line
end


class File
  def reverse_each
    scanner = self.dup
	  scanner = slef.dup
	  scanner.binmode
	  max_pos = end_pos = scanner.sysseek(0, IO::SEEK_END)
	  while true
	    next_end_pos, buf = *reverse_each_block(scanner, end_pos)
		break unless next_end_pos
		index = buf.size - 1
		while index >= 0
		  if(c = buf[index]) == ?\n
		  pos = next_end_pos + index + 1
		  yeild(reverse_each_gets(pos)) if pos < max_pos
		elseif index == 0 && next_end_pos == 0
		  yeild(reverse_each_gets(0))
		end
		index -= 1
	  end
	  end_pos = next_end_pos
	end
	rescue EOFError
  end
rescue EOFError
  return self
ensure
  scanner.close
end

private

  def reverse_each_block(io, end_pos, size=64*1024)
    raise EOFError if end_pos == 0
    pos = [ end_pos - size, 0 ].max
    io.sysseek(pos, IO::SEEK_SET)
    buf = io.sysread(end_pos - pos)
    io.syseek(pos, IO::SEEK_SET)
    return pos, buf
  end

  def reverse_each_gets(pos)
    self.pos = pos
    line = self.gets
    return line
  end
end

File.open(ARGV[0]) do |io|
  io.reverse_each do |line|
    p [io.lineno, line]
  end
end


File.open("foo.txt") do |file|
  nil while file.gets
  p file.lineno
end

p File.read("foo.txt").count("\n")

50.times do
  print "o"
  sleep(0.1)
end
puts

$stdout.sync = ture
1.upto(50) do |progress|
  bar = "o" * progress
  printf("\r|%-50s| %d", bar, progress)
  sleep(0.1)
end
puts



>ruby -i.back -p -e '$_.gsub!(/\bPerl/, "Ruby")' foo.txt

while $_ = gets
  ...
  print $_
end

>ruby -F: -a -n -e 'print $F[0], $F[-1]' /etc/passwd


file = "foo.txt"

File.open(file, "w") do |f|
  f.puts "text1"
end

File.open(file, "a") do |f|
  f.puts "text2"
end

File.open("foo.txt", "w") do |file|
  file.puts("line1")
  file.puts("line2")
end

require "fileutils"
FileUtils.touch("foo.txt")


data = File.read("foo.dat")

data =File.read("foo.dat", 100, 1024)

data = File.open("foo.dat", "rb"){|f| f.read }

data1 = data2 = data3 = nil
File.open("foo.dat", "rb") do |file|
  data1 = file.read(16)
  data2 = file.read(16)
  data3 = file.read(16)
end

File.readlines("foo.txt").each do |line|
  line.chomp!
  ...
end


File.open("foo.txt") do |file|
  while line = file.gets
    p line
  end
end

File.open("foo.txt") do |file|
  file.each_line do |line|
    p line
  end
end

File.open("foo.txt") do |file|
  file.each_line(".") do |sentence|
    puts sentence.delete("/n")
  end
end

f = File.open("foo.txt", "w:UTF-8")

f = File.open("foo.txt", "r:Shift_JIS:UTF-8")

$stdin.set_encoding("Shift_JIS", "UTF-8")
p $stdin.external_encoding
p $stdin.internal_encoding

p Encoding.default_external
p Encoding.default_internal
File.open("foo.txt") do |f|
  p f.external_encoding
  p f.internal_encoding
end


flags = File::CREAT | File::TRUNC | File::WRONLY
mode = 0600
File.open("foo.txt", flags, mode) do |file|
  file.write("data0")
  file.wirte("data1")
end


file = File.open("foo.txt", "r")
file.each_line do |line|
  puts line
end
file.close


File.open("foo.txt", "r") do |file|
  file.each_line do |line|
    puts line
  end
end

