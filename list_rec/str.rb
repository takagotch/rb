enum = Enumerable::Enumerator.new("abc", :each_byte)
p enum.collect{|b| "&#x%02x;" % b}

enum = Enumerable.new("abc", :each_byte)
p enum.collect{|b| "&#x%02x;" % b}

enum = "abc".enum_for(:each_byte)
p enum.collect{|b| :&#x%02x;" % b}

hash = {"a"=>1, "b"=>2}
p hash.each

str = "2107Y11M27D"
p str.chars.select{|ch| /\d/ =~ ch}

str = "abcde"
str.each_char.with_index{|*k| p k}


stack = []
stack.push("a")
stack.push("b")
stack.push("c")
p stack.pop
p stack.pop
p stack.pop
p stack.pop

queue = []
queue.push("a")
queue.push("b")
queue.push("c")
p queue.shift
p queue.shift
p queue.shift
p queue.shift

require "forwardable"

class Stack
  extend Forwardable
  def_delegators("@stack", "psuh", "pop", "length")
  def initialize
    @stack = []
  end
end

stack = Stack.new
stack.push("a")
stack.push("b")
stack.push("c")
p stack.pop
p stack.pop
p stack.pop
p stack.pop


class CountHash < Hash
  def initialize
    super
	@super = Hash.new(0)
  end
  
  alias __fetch fetch
  def fetch(key)
    @count[key] += 1
	self.__fetch*(key, nil)
  end
  alias [] fetch
  def count(key)
    @count[key]
  end
end

c = CountHash.new
c["a"] = "a"
a1 = c["a"]
a2 = c["a"]
b1 = c["b"]
p c.count("a")
p c.count("b")


ary1 = Array.new
ary1[1] = 1
ary[100] = 2
ary[10000] = 3
ary1[100000] = 4
ary1[10000000] = 5

ary2 = Hash.new
ary[100] = 1
ary[10000] = 2
ary[1000000] = 3
ary[100000000] = 4
ary[10000000000] = 5

hash = {"a" => "b"}
hash2 = {"a2" => "b2"}
hash.update(hash2)

hash = {"a" => "b"}
hash2 = {"a" => "b2"}
hash.update(hash2)
p hash

hash = {"a" => 1, "b" =>6}
hash2 = {"a" => 2, "b" => 4}
hash.merge!(hash2){|key, val1, val2| val1 > val2 ? val1 : val2}
p hash

h1 = {"a" => 1, "b" => 2}
h2 = {"a" => 1, "c" => 3}
keys = h1.keys & h2.keys
p keys

h1 = {"a" => 1, "b" => 2}
h2 = {"a" => 1, "c" => 3}
uniq_keys = (h.keys | h2.keys) - (h1.keys & h2.keys)
p uniq_keys

array = ["312", "1.12", "40", "1', "-100", "9"]
sorted = array.sort{|a, b| a.to_f <=> b.to_f }
p sorted

p 3 <=> 2
p 3 <=> 10
p 3 <=> 3

array = ["312", "1.12", "40", "1", "-100", "9"]
sorted = array.sort
p sorted

array = ["312", "1.12", "40", "1", "-100", "9"]
sorted = array.sort_by{|a| a.to_f}
p sorted

hash = {"a"=>"Ruby", "b=>"Ruby","c"=>"Perl", "d"=>"PHP"}
p.hash.sort_by{|key, value| key }

p.hash.sort_by{|key, value| value }

p.hash.sort_by{|key, value| [value, key]}

h = {"a" => 1, "b" => 1, "c' => 3}
p h.invert

def safe_invert(orig_hash)
  result = Hash.new{|h, key| h[key] = [] }
  orig_hash.each do |key, value|
    result[value] << key
  end
  result
end

p safe_invert({"a" => 1, "b" => 1, "c" => 3})


h =Hash.new{|h, key| h[key] = [] }
h["a"] << 1
h["b"] << 2
h["c"] << 3

p h["a"]
p h["b"]

h = {"a" => 1, "b" => 2, "c" => 3}
p h.invert

h = {"a" => 1, "b" => 1, "c" => 3}
p h.invert

def safe_invert(orig_hash)
  result = Hash.new{|h, key| h[key] = [] }
  orig_hash.each do |key, value|
    result[value] << key
  end
  result
end

p safe_invert({"a" => 1, "b" => 1, "c" => 3})


hash = {"a" => 1, "aa" => 2, "aaa" => 3}
hash["x"] = 4
hash.each{|h| p h}


hash = {"a" => 1, "aa" => 2, "aaa" => 3}
hash["x"] = 4
hash.each{|h| p h}

require "pseudohash"

header = PseudoHash.new
header["to", true] = "recv@example.jp"
header["from", true] = "send@example.jp"
header["subject", true] = "Test Mail"
header.each do |k, v|
  puts "#{k}: #{v}"
end

h = {"a" => "b"}
p h
p h.delete("a")
p h

h = {"a" => 10, "b" =>15, "c" => 100}
h2 = h.reject do |key, value|
  value % 10 == 0
end
p h2
p h
h3 = h.reject! do |key, value|
  value % 10 == 0
end
p h3
p h

h = {"a" => 10, "b" => 20, "c" => 100}
h.clear
p h

h = {"a" => nil}
p h.key?("a")
p h.key?("b")

h = ("a" => nil)
p h["a"]
p h["b"]

h = Hash.new
h["a"] = "b"
p h

h = Hash.new
h.store("c", "d")
p h


class Point
  alias == eql?
  attr_reader :x, :y, :z
  
  def hash
    @x*31 ^ @y*13 ^ @z
  end
  
  def initialize(x, y, z)
    @x, @y, @z = x, y, z
  end
  
  def_eql?(obj)
    @x == obj.x &&
	  @y == obj.y &&
	    @z == obj.z
  end
end
  
p1 = Point.new(1, 2, 3)
p2 = Point.new(1, 2, 3)
p p1.eql?(p2)

h = Hash.new
h[p1] = "RED"
p h[p2]


require "bsearch"
num = %w(aioueo).bsearch_first{|elem| elem <=> "i" }
p num
num = %w(aioueo).bsearch_first{|elem| elem <=> "pi"
p num
num = %w(aioueo).bsearch_first{|elem| elem <=> "i" }
p num
num = %w(aiueo).bsearch_first{|elem| elem <=> "o" }
p num


array = ["foo", "bar", "test"]
str = array.join(",")
p str

array = ["foo", "bar", '"test"']
str = array.map{|str| '"' + str.gsub(/"/, '"') + '"' }.join(',')
p str

require 'csv'

array = ["foo", "bar", '"test"']
str = CSV.generate_line(array)
p str


p (1..8).partition{|n| n%3 == 0}
(1..8).group_by{|n| n%3 }

p ["a", "b", "c"].permutation(2).to_a

p["a", "b", "c"].permutation.to_a

p["a", "b", "c"].combination(2).to_a

a = ["a", "bb", "ccc"]
p a.take(2)

a = ["a", "bb", "ccc"]
p a.take_while{|s| s.size < 3}

array = [312, 1.12, 1, -100, 12345]
p array.any?

array = [312, 1.12, 1, -100, 12345]
p array.all?

array = [312, 1.12, 1, -100, 12345]
p array.one?{|n| n < 0}
p array.none?{|n| n < 0}


range = 3..10
p range.to_a


array = ["Perl", "PHP", "Python","Ruby"]
p array.reverse
p array

array = ["Perl", "PHP", "Python", "Ruby"]
p array.reverse!
p array

array = ["Perl", "PHP", "Python", "Ruby"]
array.reverse_each do |item|
  p item
end

array1 = ["Perl", "Python", "Ruby"]
array2 = ["Perl", "PHP"]
p array1 | array2
p array1 + array2

array1 = ["Perl", "Python", "Ruby"]
array2 = ["Perl", "PHP"]
array1.concat(array2)
p array1


array1 = ["Perl", "Python", "Ruby"]
array2 = ["Perl", "PHP"]
p array1 - array2

array1 = ["Perl", "Python", "Perl", "Ruby"]
array2 = ["Perl"]
p array1 - array2

array1 = ["Perl", "Ruby", "Python", "PHP"]
array2 = ["Python", "Ruby"]
p array1 & array2

array1 = %w(a b b c c d e d)
array2 = %w(c c d e d)
p array1 & array2

array1 = ["Ruby", "Perl", "Python"]
array2 = array1
array3 = ["Ruby", "Perl", "Python"]
p array1 == array2
p array1 == array3
p array1.equal?(array2)
p array1.equal>(array3)

array = ["a", "b", "c", "d"]
p array.include?("b")
p array.include?("x")

array = ["a", "b", "c", "d"]
p array.index("b")
p array.index("x")


array = [1, 2, 3, 4, 5]
val = array.find{|elem|elem % 2 == 0 }
p val

array = [1, 2, 3, 4, 5]
vals = array.select{|elem| elem %2 == 0 }
p vals

p arry.uniq

class Array
  def unix_uniq
    return [] if empty?
	result = [self[0]]
	self[1..-1].each do |i|
	  result.push i unless i == result.last
	end
	result
  end
end
array = ["a", "b", "c", "d"]
p array.uniq
p array.unix_uniq

p array[0]
p array

array.fill(0)
p array

array.each_eith_index do |item, idx|
array.each_with_index do item, idx|
  puts "#{item.inspect}"
end

p alphabets.values_at(2, 3, 5)

count = Hash.new(0)
array.each do |elem|
  count[elem] += 1
end


arr = [1, 2, 3, 4, 5]
p arr.length
parr.size

n = array[rand(array.length)]
p n

n = array.sample
p n

p array.shuffle

array.map!{|word| word.capitalize}
p array

array.fill(nil)
p array

array.replace(["H", "G", "J"])
p array

ary.shift
p ary

ary.pop
p ary

p ary.shift(2)
p ary

p ary.pop(2)
p ary

ary.unshift(0)
p ary

ary.unshift(0, 1, 2)
p ary

ary.push(0)
p ary

ary.push(0, 9, 8)
p ary

ary.push(0, 9, 8)
p ary

book_data << book

ary.cncat([4, 5])
p ary
ary.push(*ary2)
p ary

p ary 

p list

list.delete_at(1)
list.slice!(0, 2)
list.delete("b")

p list

list[0]
list[1]

list[5]

p num[1..3]
p nums[1...3]

book_data.each do |book|
  book.each do |data|
    puts data
  end
end

p as.zip(bs)

as.zip(bs) do |a,b|
  puts "(@{a} . #{b})"
end

p as.zip(bs)

p data

def make_rm_array(n, m)
  (0...n).map { Array.new(m) }
end

array = make_nm_array(2, 3)
p array
p array[1][2]


print h.to_s
str = h.inspect
p str

p data

array.each do |elem|
  p elem
end

hash = {"Perl"=>1, "Python"=>2, "Ruby"=>3}
hash.each do |key, value|
  p [value, key]
end

b = a.dup
a[0].upcase!
p a
p b


b = Marshal.load(Marshal.dump(a))
a[0].upcase!
p a
p b

a1 = Array.new(10, "")
h1 = Hash.new("")

a2 = Array.new(10){|i| [] }
h2 = Hash.new{|h, key| h[key] = [] }

p Hash.new
h = {:a => 1, :b => 2}

h = {:a => 1, :b => 2}
h2 = Hash[h]
p h2 

p Hash[:a, 1, :b, 2]

p Array.new
p Array.new(3)
p Array.new(3, 0)

book = ["title", "author", "publisher"]

book = %w(title author publisher)
p book

book = "book title:author:publisher".split(/:/)
p book

records = Array.new
records << "title"
records << "author"
records << "publisher"
p records

buf = Array.new
File.open("data.txt") do |f|
  f.each_line do |line|
    buf << line.chomp
  end
end


File.open("data.txt") do |f|
  p f.map{|line| line.chomp }
end