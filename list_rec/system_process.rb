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
