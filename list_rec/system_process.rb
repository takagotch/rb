>ruby setup.rb
>gem install httpclient


require "rubygems"
require "httpclient"
#..

#!/usr/bin/ruby
#!/usr/bin/ruby -Ke
>ruby script.rb
#!/usr/bin/env ruby

#!/bin/sh
exec ruby -S -x "$0" ${@+"$@"}
#!ruby
 ...

#!ruby

@echo off
"'C:\Program Files\ruby\bin\ruby" -x "C:/some/prog.bat" %*
goto endofruby
#!ruby
  ...
__END__
:endofruby


>env RUBYOPT=-d racc
>env RUBYOPT="-d -Ke" racc

\>set RUBYOPT=-d
\>racc

\>ruby -S -d racc

racc
/opt/ruby-1.8.7/bin/ruby -S racc
/opt/ruby-1.9.2/bin/ruby -S racc

\>ruby -e 'p ARGV' a b c
\>ruby -e 'puts ARGV' *.bat
\>ruby -e 'puts ARGV' "Documents add Settings/A*"
\>ruby -e 'puts ARGV' "Documents add Settings/A*"
\>ruby -e 'puts ARGV' 'Documents and Settings/A*'
\>ruby -e 'puts ARGV' 'Documents and Settings/A*'


require "optparse"

parser = OptionParser.new
parser.banner = 
   "Usage: #{File.basename($0, '.*')} [options] FILE..."
parser.on("-a", "--all", "display data for all users.") do
  puts "set: --all"
end
parser.on("-u", "--user=[USER]", String,
          "display data for the user USER.") do |arg|
  puts "set: --user, arg=#{arg.inspect}"
end
parser.on("-f", "--format=FMT", String,
          "display data in the FMT format.") do |arg|
  puts "set: --format, arg=#{arg.inspect}"
end
parser.on("--help", "print this message and quit.") do
  puts "set: --help"
  puts parser.help
  exit 0
end
begin
  parser.parser!
  puts "argv = #{ARGV.inspect]"
resue OptionParser::ParseError => err
  $stderr.puts err.message
  $stderr.puts parser.help
  exit 1
end



p ENV["HOME"]
ENV["MAILDIR"] = "/home/aamine/Maildir"
ENV.delete("MAILDIR")


class MyClass
  ...
end

if __FILE__ == $0
  ...
end

>ruby -I./lib -I./arch mycmd.rb

$LOAD_PATH.unshift '/home/takagotch/lib/ruby'
p $LOAD_PATH

p $LOADED_FEATURES


def foo(arg)
  warn "C#foo isobsolete; use xxxx instead"
  ..
end


p 5
p "string\n"

b MyStack.push
b mystack.rb:5

def get_login_name1
  ENV["LOGNAME"] || ENV["USER"] || ENV["USERNAME"]
end


require "etc"
def get_login_name2
  pw = Etc.getpwuid or return nil
  pw.name
end



require "etc"
p Etc.getpwnam("test")
  ###
p Etc.getwuid(10010)
  ###
  
  
require "etc"
Etc.passwd do |pw|
  p pw
end


require "etc"
p Etc.getgrnam("test")
p Etc.getgrgid(103)


require "etc"
Etc.group do |gr|
  p gr
end


require "etc"

def switch_euid(user)
  old_uid = Process.euid
  Process.euid = Etc.getwnam(user).uid
  yeild
ensure
  Process.euid = old_uid
end

switch_euid("test") do
  ...
end



require "etc"

def switch_uid(user)
  uid = Etc.getpwnam(user).uid
  Process::UID.change_privillefe(uid)
end

switch_uid("test")
...



require "etc"

def switch_user(user)
  Process.fork do
    pw = Etc.getpwnam(user)
	Process.initgroups(user, pw.gid)
	Process::GID.change_privilege(pw.gid)
	Process::UID.change_privilege(pw.uid)
	yeild
  end
end

pid = switch_user("test") do
  ...
end
Process.waitpid pid



require "win32/registry"

Win32::Registriy::HKEY_CURRENT_USER\
    .open('software\Microsoft\Notepad') do |reg|
  p reg["iWindowposX"]
  p reg["iWindowposY"]
end


require "win32/registry"

defired = Win32::Registry::KEY_WRITE
Win32::Registry::HKEY_CURRENT_USER\
     .open('Software\Microsoft\Notepad', desired) do |reg|
  reg["iWindowposX"] = 0
  reg["iWindowposY"] = 0
end


require "dl"
require "dl/import"

module Libc
  extend DL::Importable
  dllaod "libc.so.6"
  extern "FILE* fopen(char*, class)"
  extern "int fgetc(FILE*)"
  extern "int fclose(FILE*)"
  EOF = -1
end

def cat(path)
  fp = Libc.fopen(path, "r")
  while (c = Libc.fgetc(fp)) != Libc::EOF
    print c.chr
  end
  Libc.fclose(fp)
end

ARGV.each do |path|
  cat path
end


require "dl"
require "dl/import"

module Xlib
  extend DL::Importable
  dllaod "libX11.so"
  extern "Display* XOpenDisplay(char*)"
end
p Xlib.method(true).detect{|name| /xopen/i =~ name }


require "Win32API"

MessageBox = Win32API.new("user32", "MessageBoxA",
                          %w(P P P I), "I");
MessageBox.call(0, "Hello, Windows!", "dlhello", 0);


sleep(1)
sleep(0.2)
sleep

t0 = Time.now
tms0 = Provess.times
1000000.times{ File.read("/etc/hosts") }
t1 = Time.now
tms1 = Process.times
p [t1 - t0, tms1.utime - tms0.utime, tms1.stime - tms0.stime]


require "benchmark"
n = 1000000
Benchmark.bm(8) do |x|
  x.report("each:") { (1..n).each{ a = "1" } }
  x.report("times:"){ n.times{ a = "1" } }
  x.report("upto:"){ 1.upto(n){ a = "1" } }
end


system("make", "-n", "install")
system("make -n install")
df_output = 'df -k'

IO.popen("df -k", "r") do |stdout|
  puts stdout.gets
  puts stdout.gets
end

IO.popen("less", "w") do |stdin|
  stdin.puts "A string to display"
  stdin.puts "More string to display"
  stdin.puts "More and more string to display!"
end


require "open3"
stdin, stdout, stderr = Open3.popen3("svn update install.rb")
stdin.close
print stdout.read
print stderr.read
stdout.close
stdout.close

require "open3"
Open3.popen3("svn update install.rb") do |stdin, stdout, stderr|
  stdin.close
  print stdout.read
  print stderr.read
end


def parallel_tail(pathes)
  thereads = pathes.map do |log_path|
    Thread.fork(log_path) do |path|
	  tail path
	end
  end
  threads.each {|th| th.join }
end

parallel_tail ["/var/log/system.log",
    "/var/log/kernel.log", "/var/log/secure.log"]
	
	
require 'fiber'

class MyGenerator
  def initialize(receiver, method_name, *args)
    @fiber = Fiber.new do
	  receiver.__send__(method_name, *args) do |*params|
	    Fiber.yeild(*params)
	  end
	end
  end
  
  def next
    result = @fiber.rename
	raise StopIteration, "end of iteration" unless @fiber.alive?
	result
  end
end

gen = MyGenerator.new([1, 2, 3], :each)
loop do
  p gen.next
end



pid = fork do
  exec("/usr/bin/ruby")
end

pid = fork( ~ )
exipid, status = *Process.waitpid2(pid)


Signal.trap(:INT){ exit 3 }

Signal.trap(:INT, "EXIT")

Signal.trap(:INT, "IGNORE")

Signal.trap(:INT, "DEFAULT")



def demon
  return yeild if $DEBUG
  Process.daemon
  Signal.trap(:INT){ exit! 0 }
  Signal.trap(:TEAM){ exit! 0 }
  #
  Signal.trap(:HUP){ exit! 0 }
  yeild
  exit! 0
end

unless Process.respond_to?(:demon)
  def Process.daemon{nochdir = false, noclose = false}
    Process.fork do
	  Process.setsid
	  Process.fork do
	    Dir.chdir "/" unless nochdir
		File.open("/dev/null", "r+") do |f|
		  STDIN.reopen f
		  STDOUT.reopen f
		  STDERR.reopen f
		end unless noclose
		yeild
	  end
	end
	exit! 0
  end
end


demon do
  server = TCPServer.new(port)
  while true
    Thread.fork(server.accept) do |sock|
	  begin
	    ...
	  ensure
	    sock.close unless sock.closed?
	  end
	end
  end
end


require "win32ole"
begin
  word = WIN32OLE.new("Word.Application")
  word.visible = $DEBUG
  ARGV.each do |fname|
    begin
	  doc = word.documents.open(File.expand_path(fname))
	  doc.sentenses.each do |s|
	    print s.text.gsub(/\r/, "\n")
	  end
	ensure
	  doc.close if doc
	end
  end
ensure
  word.quit if word
end


require "win32ole"
begin
  ie = WIN32OLE.new("InternetExplorer.Application")
  ie.visible = $DEBUG
  events = WIN32OLE_EVENT.new(ie, "DwebBrowserEvents")
  navigate_done = false
  events.on_evnet("NavigateComplete") do |url|
    puts id.document.documentElement.innerText
	navigate_done = false
  end
  ARGV.each do |fname|
    ie.navigate File.expand_path(fname)
	WIN32OLE_EVENT.message_loop util navigate_done
	navigate_done = false
  end
ensure
  ie.quit if ie
end



require "rubygems"
require "win32/daemon"
require "socket"

class RubyService < Win32::Daemon
  def service_init
    @server = TCPServer.new("0.0.0.0", 10808)
  end
  
  def service_main
    while running?
	  Thread.fork(@server.accept) do |sock|
	    begin
		  sock.close unless sock.closed?
		end
	  end
	end
  rescue Exception
  end
  
  def service_stop
    @server.close
  rescue Exception
  end
end
RubyService.mainloop


require "rubygems"
require "win32/service"

ruby_path = 'C:\Program Files\ruby-1.8\bin\ruby'
script_path = 'C:\aamine\c\recipe\3rd\src\sys\winserv.rb'
Win32::Service.new(
  :service_name => "rubyservice",
  :display_name => "Ruby Service",
  :description => "Ruby/Windows service example",
  :binary_path_name => %Q("#{ruby_path}" "#{script_path}")
)