require "tempfile"

temp = Tempfile.new("my-temp")
temp.puts "test test test"
temp.close
...
temp.open
p temp.read
temp.close(true)

require "tmpdir"

dir1 = Dir.mktmpdir
p dir1

dir2 = Dir.mktmpdir("foo")
p dir2

Dir.mktmpdir("foo") do |dir|
  p dir1
  ...
end


def create_tempfile(basename, num=10, &block)
  flags = File::RDWR | File::CREAT | File::EXCL
  num.times do |i|
    begin
	  return File.open("#{basename}.#{$$}.#{i}", flags, 0600, &block)
	rescue Errno::EEXIST
	  next
	end
  end
  raise "create failure"
end

create_tempfile("my-app") do |io|
  io.path
  ...
end

require "fileutils"
FileUtils.chdir("/tmp", :verbose=>true)
FileUtils.mkdir("/foo", :mode=>0700, :noop=>true, :verbose=>true)
FileUtils.rm_r("/foo", :noop=>true, :verbose=>true)


Dir.rmdir("dir")

require "fileutils"
FileUtils.rm_r("dir")
FileUtils.rm_r("foo.txt")
FileUtils.rm_r(["dir1", "dir2"])
FileUtils.rm_r(Dir.glob("dir*"))

require "fileutils"
FileUtils.rm_r(["dir1", "dir2"], :force=>true)
FileUtils.rm_r(["dir1", "dir2"])

require "fileutils"
FileUtils.cp_r("foo", "bar")
FileUtils.cp_r(["foo", "bar"], "dir")
FileUtils.cp_r(Dir.glob("foo*"), "dir")

require "fileutils"
FileUtils.cp_r("foo", "bar", :preserve=>true)
FileUtils.cp_r("foo", "bar", :preserve=>true,
               :derefernce_root=>true)
			   
			   
require "find"
Find.find(File.expand_path(".")) do |path|
  next unless File.directory?(path)
  puts path
end

require "find"
Find.find(".") do |path|
  next unless File.directory?(path)
  Find.prune if path.split("/").size > 2
  puts path
end

Dir.mkdir("foo")
Dir.mkdir("foo", 0755)

require "fileutils"
FileUtils.mkdir_p("foo/bar/baz")
FileUtils.mkdir_p("foo/bar/baz", :mode=>0755)
FileUtils.mkdir_p(["foo/bar/baz", "hoge/funi"])

require "fileutils"
p FileUtils.cmp("/bin/ls", "/bin/ls")

def same_entity?(path1, path2)
  st1 = File.stat(path1)
  st2 = File.stat(path2)
  if st1.dev == st2.dev && st1.ino == st2.ino
    return true
  end
  return false
end


File.symlink("real.txt", "symlink.txt")

require "fileutils"
FileUtils.ln_s("real.txt", "symlink.txt")
FileUtils.ln_s("foo.txt", "bar.txt"), "dir")

File.symlink("real.txt", "symlink.txt")
p File.readlink("symlink.txt")


atime = mtime = Time.now
File.utime(atime, mtime, "foo.txt")
File.utime(atime, mtime, "foo.txt", "bar.txt")

require "fileutils"
FileUtils.touch("foo.txt")
FileUtils.touch(["foo.txt", "bar.txt"])

File.chmod(0644, "foo.txt")
File.chmod(0644, "foo.txt", "bar.txt")

require "fileutils"
FileUtils.chmod(0644, "foo.txt")
FileUtils.chmod(0644, ["foo.txt", "bar.txt"])

require "etc"
pw = Etc.getpwnam("takagotch")
File.chown(pw.uid, pw.gid, "foo.txt", "bar.txt")

stat = File.stat("/usr/local/bin/ruby")
puts stat.mtime
puts "0%o" % stat.mode
puts stat.size

stat = File.stat("/usr/local/bin/ruby")
p stat.file?
p stat.directory?
p stat.readable?
p stat.writeable?
p stat.executable?

File.open("foo.txt", "w"){|f| f.write("a" * 100) }
File.symlink("foo.txt", "bar.txt")
st1 = File.stat("bar.txt")
p st1.symlink?
p st1.file?
p st1.size
st2 = File.lstat("bar.txt")
p st2.symlink?
p st2.file?
p st2.size


File.unlink("foo.txt")
File.unlink("foo.txt", "bar.txt")

require "fileutils"
FileUtils.rm("foo.txt")
FileUtils.rm(["foo.txt", "bar.txt"])

require "fileutils"
FileUtils.rm(["foo.txt", "bar.txt"], :force=>true)


require "fileutils"
FileUtils.cp("foo.txt", "foo.back")


require "fileutils"
FileUtils.cp("foo.txt", "dir")
FileUtils.cp(["foo.txt", "bar.txt"], "dir")
FileUtils.cp(Dir.glob("*.txt"), "dir")

require "filename"
FileUtils.cp("foo.txt", "bar/txt", :preserve=>true)

require "fileutils"
FileUtils.install("src.txt", "/some/where/dir", :ode=>0644)

File.rename("foo.txt", "foo.back")
File.rename("dir", "dir.back")
File.rename("foo.txt", "dir")

require "fileutils"
FileUtils.mv("foo.txt", "foo.back")
FileUtils.mv(["foo.txt", "back.txt"], "dir")
FileUtils.mv(Dir.glob("*.txt*"), "dir")


File.expand_path(__FILE__)

dir = File.dirname(__FILE__)
file = File.expand_path("config.dat", dir)
progname = File.basename($0)


p Dir.pwd
Dir.chdir("tmp")
p Dir.pwd

p Dir.pwd
Dir.chdir("tmp") do
  p Dir.pwd
end
p Dir.pwd

require "fileutils"
FileUtils.chdir("/tmp", :verbose=>true)
FileUtils.chdir("/var/mail", :verbose=>true)

Dir.pwd

Dir.glob("*.html")

Dir.glob("*.[ch]")

Dir.glob("{foo,bar}*")
Dir.glob(["foo*", "bar*"])
Dir.glob(%w(foo* bar*))

Dir.glob("*.{html,htm]", File::FNM_CASEFOLD)
Dir.glob({"*.html", "*.hml", "*.HTML", "*.HTM"})
Dir.glob("{foo.bar}.{a,b}")
Dir.glob(File.expand_path("~/. *"))
Dir.glob("**/*")
Dir.glob("**.*.{rb,cgi}")
Dir.glob("/etc/**/")

Dir.glob("*.[ch]").sort

Dir.glob("/usr/local/bin/.*")
Dir.glob("/usr/local/bin/*", File::FNM_DOTMATCH)

Dir.entries("/usr/local/bin")

require "pathname"
Pathname.glob("/usr/local/bin/*", file::FNM_DOTMATCH)
Pathname("/usr/local/bin").entries

p File.fmatch("*.rb", "foo.rb")
p File.fmatch("foo.*", "foo.rb")
p File.fmatch("*foo*.rb", "foo.rb")
p File.fmatch("ba[rz].rb", "foo.rb")
p File.fmatch("ba[rz].rb", "bar.rb")
p File.fmatch("ba[a-z].rb", "bat.rb")
p File.fmatch("ba[a-z].rb", "ba-.rb")
p File.fmatch("ba[-a-z].rb, "ba-.rb")
p File.fmatch("ba?.rb", "baz.rb")
p File.fmatch("ba?.rb", "ball.rb")
p File.fmatch("foo?bar.rb", "foo-bar.rb")
p File.fmatch("foo?bar.rb, "foo/bar.rb")
p File.fmatch("?foo.rb", "foo.rb")
p File.fmatch("*foo.rb", "foo.rb")

p File.expand_path("LONGFI~1.TXT::$DATA")
p File.expand_path("LONGFI~1.TXT")
p File.expand_path("LONGFILENAME.TXT")


require "pathname"

rubybin = Pathname("/usr/local/bin/ruby")
pregix = Pathname("/usr/local")
rubylibdir = Pathname("/usr/local/lib/ruby/1.8")

p rubybin.relative_path_from(prefix).to_s
p rubybin.relative_path_from(rubylibdir).to_s

p File.expand_path("ruby", "/usr/local/bin")
p File.expand_path("./ruby", "/usr/local/bin")
p File.expand_path("../lib", "/usr/local/bin")

Dir.chdir("/var/tmp")
p File.expand_path("..")
p File.expand_path("../lib")

p ENV["HOME"]
p File.expand_path("~/Mail")
p File.expand_path("~root")

Dir.chdir("/var/tmp")
p File.absolute_path("~/Mail")
p File.absolute_path("~aamine")

require "pathname"

path = "usr/lib/ruby/1.8/../../.././/bin/ruby"
pn = Pathname(path)

p pn.expand_path("/").to_s

p pn.cleanpath.to_s

p File.split("/foo/bar/test.rb")
p File.split("test.rb")

filename = "/foo/ba/test.rb"
p File.dirname(filename)
p File.basename(filename)
p File.basename(filename, ".rb")
p File.basename(filename, ".*")
p File.extname(filename)

filename = "c:\\foo\\bar\\test.rb"
p File.split(filename)
p File.dirname(filename)
p File.basename(filename)

p File.dirname("C:/")
p File.dirname("//myhost")

p File.dirname("C:/")
p File.dirname("//myhost")

p File.join("a", "b")
p File.join("a", "b", "c")
p File.join("a/", "b")

require "pathname"

path = "/usr/lib/ruby/1.8/pathname.rb"
pn = Pathname.new(path)

p pn.to_s

p pn.dirname
p pn.basename
p pn.extname
p pn.dirname.basename

p pn.dirname.join("cgi.rb")
p pn.dirname + "cgi.rb"