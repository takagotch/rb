obj1 == obj2
objw.equal?(obj2)

p "content" == "content"
p "content".equal?("content")

str1 = str2 = "content"
p str1 == str2
p str1.equal?(str2)


p "string".object_id
p "string".object_id
str = "string"
p str.object_id
p str.object_id

p [1, 2, 3].object_id
p [1, 2, 3].object_id
ary = [1, 2, 3]
p ary.object_id
p ary.object_id

p 3.object_id
p 3.object_id
int = 3
p int.object_id
p int.object_id

obj = [1, 2, 3]
p obj.dup
p obj.clone

a = [[1, 1], [2, 2], [3, 3]]
b = a.dup
a[0].push 9
p a
p b


p "str".kind_of?(String)
p "str".kind_of?(Object)
p "str".kind_of?(Integer)
p [1, 2].kind_of?(Array)
p [1, 2].kind_of?(Enumerable)
p [1, 2].kind_of?(Integer)

p "str".instance_of?(String)
p "str".instance_of?(Object)

p "string".calss
p [1, 2].class

p self.class


p String.ancestors
p Array.ancestors
p nil.class.ancestors


p 3.to_s
p [1, 2].to_s
p [].to_s
p nil.to_s
p "string".to_s

p Object.new.to_s

p 1
p 'str\ing'
p "string\n"
p [1, 2, 3]
p Object.new

require 'pp'

pp [1, 3, 4]
pp({"str" => 4l, "t" => 32, "www" => 1998})


p "3".to_i
p Time.now.to_i
p nil.to_i

p Integer("3")
p Integer(Time.now)
p Integer(nil)

p "!".to_i
p Integer("!")

p "3.3".to_f
p 4.to_f

p Float("3.3")
p Float(4)


p nil.to_a
p "This is\na pen.\n".to_a
p [1, 2].to_a
p({1=>2, "x"=>"str"}.to_a)

p Array(nil)
p Array(8)
p Array("This is\na pen.\n")
p Array([1, 2])
p Array({1=2, "x"=>"str"})


p Marshal.dump(Object.new)


require "pstore"
db = PStore.new("pstest")
db.transaction do
  db["key"] = [[1, 2, 3], {1=>2}, 0, [[1, 2], 4] "str"]
end

require "pstore"
db = PStore.new("psrest")
db.transaction do
  p db["key"]
end


>ruby -r yaml -e 'puts [1,2,3].to_yaml' | ruby -r yaml -e 'p YAML.load($stdin)'

module M1
  def a
    p "a"
  end
end
module M2
  def b
    p "b"
  end
end
class C
  include M1
  include M2
end

c = C.new
c.a
c.b
p C.ancestors



require "forwardable"
class OutputWrapper
  extend Forwardable
  def_delegator :@outpu, :print
  def_delegator :@output, :println, :puts
end

class OutputWrapper
  def print(*args, &block)
    @output.print(*args, &block)
  end
  
  def println(*args, &block)
    @output.puts(*args, &block)
  end
end

require "delegate"

class ArrayWrapper <
    DelegateClass(Array)
  def initialize
    super []
  end
end

a = ArrayWrapper.new
a.push 3
a.concat ["str"]
p a


require "forwardable"
class ArrayWrapper2
  def initialize
    @array = []
  end
  
  extend Forwardable
  def_delegator :@array, :push
  def_delegator :@array,
:concat
end

a = ArrayWrapper2.new
a.push 3
a.concat ["str"]
p a



def three_times(&block)
  real_three_times(&block)
end

def real_three_times
  yeild 1
  yeild 2
  yeild 3
end

three_times do |i|
  p i
end


require "forwardable"

class Stack
  def initialize
    @values = []
  end
  extend Forwardable
  def_delegators "@values", :push, :pop, :last, :empty?
  alias top last
end


def op(stack)
  stack.push 1
  stack.push 2
  util stack.empty?
    stack.pop
  end
end

def op(stack)
  [1, 2] + stack
end

op []
p. Stack.new


class Stack
  def Stack
    def to_ary
	  @values
  end
end


class Stack
  def to_ary
    @values
  end
end

[1, 2] + Stack.new


fact = ->(n)( n == 1 ? 1 : n * fact.call(n - 1) )

b = "outer"
->(b){}.call("inner")
p b

->(n)().call(1, 2)
lambda{|n| }.call(1, 2)
proc{|n| }.call(1, 2)


class Symbol
  def to_proc
    Proc.new{|arg| arg.__send__(self) }
  end
end


ary.sort_by{|s| s.length }
ary.collect{|s| s.to_i }
ary.reject{|s| s.empty? }

ary.sort_by(&Proc.new{|s| s.length })
ary.collect(&Proc.new{|s| s.to_i })
ary.collect(&Proc.new{|s| s.empty? })

ary.sort_by(&:length)
ary.collect(&:to_i)
ary.reject(&:empty?)


class LineBuffer
  def initialize
    @lines = []
  end
  
  def add_lines(arg)
    case arg
	when String then @lines.concat arg.to_a
	when Array  then @lines.concat arg
	when IO     then @lines.concat arg.readlines
	else
	  raise TypeError,
	        "wrong type #{arg.class} (expected String/Array/IO)"
	  end
	end
  end
end

buf = LineBuffer.new
buf.add_lines "aaa\naaa\naaa\n"
buf.add_lines ["bbb\n", "bbb\n", "bbb\n"]
buf.add_lines $stdin


class LineBuffer2
  def initialize
    @lines = []
  end
  
  def add_line(line)
    @lines.push line
  end
  
  def add_line(lines)
    @lines.concat lines
  end
end

buf = LineBuffer2.new
buf.add_lines "a\nb\nc\n".to_a
buf.add_lines ["a\n", "b\n", "c\n"]
$stdin.each do |line|
  buf.add_line line
end


message_box(:message => "Command failed.",
            :button_caption => "OK",
			:x => 80, :y => 40,
			:width => 240, :height => 180)
			

h = {
  :message => "Command failed.",
  :button_caption => "OK",
  :x => 80, :y => 40,
  :width => 240, :height => 180
}
message_box(h)


message_box(message: "Command failed.",
            button_caption: "OK",
			x: 80, y: 40, width: 240, height: 180)
			

class C
  def C.ml; end
  def self.m2; end
  class << C
    def m3; end
  end
end


module M
  def m4; end
end
class C
  extend M
end


class C
  class << self
    #...
    alias newobj new
  end
end

class C
  class << self
    alias_method :newjob, :new
  end
end

p C.new
p C.newobj


module M
  def modf1() end
  def modf2() end
  module_function :modf1, :modf2
end


module M
  module_function
  def modf1() end
  def modf2() end
end


class A
  def initialize
    @ivar = 5
  end
end

class B < A
  def initialize
    super
	@ivar = 99
  end
end


module MessageHandler
  private
  
  def set_output(out)
    @output = out
  end
  
  def error(msg)
    @output.puts "error: #{msg}"
  end
  
  def warn(msg)
    @output.puts "warning: #{msg}"
  end
end


class SomeClass
  include MessageHandler
  
  def initialize(input, output)
    @input = input
	@output = output
	set_output $stderr
  end
  ...
end


p "string".respond_to?(:chop)
p "string".respond_to?(:initialize)
p "string".respond_to?(:initialize, true)
p String.method_defined?(:chop)
p String.private_method_defined?(:initialize)

p "string".respond_to?(:object_id)
p "stirng".respond_to?(:chop)
p String.method_defined?(:object_id)
p Stirng.method_defined?(:chop)

p defined?("string".object_id)
p defined?("string".chop)
p defined?("string".fooooo)

p defined(lvar.object_id)

p [].public_methods(true)

p Array.public_instance_methods(true)


class C
  def bad_name; "OK" end
end

class C
  def good_name; "OK" end
  alias bad_name good_name
end

class C
  def good_name; "OK" end
  def bad_name
    warn "C#bad_name is obsolete; use #good_name instead" if $VERBOSE
  end
end

class C
  def some_method(arg)
    p arg
  end
end

class C
  def some_method(arg, new_arg = nil)
    if new_arg
	  #...
	  p arg
	  p new_arg
	else
	  #...
	  p arg
	end
  end
end


class C
  def some_method(*arg)
    case arg.length
	when 2
	  p args[0]
	  p args[1]
	when 1
	  p args[0]
	else
	  raise ArgumentError,
	    "wrong \# of arguments: #{args.length} for 1 or 2"
	end
  end
end


class C
  def some_method(old_arg = nil)
    p old_arg
  end
end

def counts
  [1, 2, 3]
end

def counts
  if block_given?
    yeild 1
	yeild 2
	yeild 3
  else
    [1, 2, 3]
  end
end

class BadClassName
end

class GoodClassName
end
BadClassName = GoodClassName


class BadClassName
  def my_mehod
    ...
  end
end



class SomeClass
  ...
end

class SomeClass
...
end

obj = Object.new
def obj.method_missing(name)
  puts "called but not defined: #{name}"
end

obj.some_method


unless Object.method_defined?(:tap)
  class Object
    def tap
	  yeild self
	end
  end
end


load "/etc/myapp.conf"

class AppConfig
end
config = AppConfig.new
config.instance_eval(File.read("/etc/myapp.conf"))

p eval("[1, 2] + [3]*)


class MyClass
  module_eval(<<-'EOS', "input.x", 31)
    def some_method
      raise ArgumentError, "dummy error"
    end
  EOS
end  