require "nkf"
str = "aioeo"
puts NKF.nkf("--hiragana -wxm0", str)
puts NKF.nkf("--katakana --wxm0", str)

p NKF.nkf("-Lu --wxm0", "aa\nbb\r\ncc\rdd\r\n\nee\n")

puts NKF.nkf("-XWwm0", "kana")

require "romkan"
puts "kanji".to_kana
puts "kanzi'.to_kana
puts "knazi".to_roma
puts "kanji".tokunrei



require 'jpmobile'

p Jpmobile::Email.detect('example@docomo.ne.jp')
p Jpmobile::Email.detect('example@ezweb.ne.jp')
p Jpmobile::Email.detect('example@softbank.ne.jp')

domain_part = /[a-zA-z0-9][a-zA-Z0-9.-]+/
local_part = /[a-zA-Z0-9_\#!$%&`'*+\-{|}~^\/=?\.]+/
VALID_ADDRESS = /\A#{local_part}@#{domain_part}\z/n

def valid_email_address?(str)
  return false if /\s/ =~ str
  return false if /{ -Z}/ =~ str
  VALID_ADDRESS =~ str
end


require "abbrev"

class Completer
  include Abbrev
  
  def initialize(words)
    @table = Abbrev.abbrev(word)
  end
  
  def complete(head)
    @table[head] or raise CompletionError, "no match: #{head}"
  end
end



class CompletionError < StandardError; end

class Completer
  def initialize(words)
    @words = words
  end
  
  def complete(head)
    re = /\A#{head}/
	candidates = @words.select{|w| re =~ w }
	case candidates.size
	when 0
	  raise CompletionError, "no match: #{head}"
	when 1
	  raise CompletionError,
	    "multiple candidates: #{candidates.join(', ')}"
	end
  end
end

require "cgi"
puts CGI.pretty(.....)

require "url"
html_string = <<-HTML
...
HTML

p URI.extract(html_string)


p.URI.extract(html_string, %w(ftp))


data = <<YAML
---
title: "text"
author:
  - "text"
  - "text"
publisher: "text"
YAML

require "yaml"
p YAML.load(data)

require "yaml"

obj = {
  1 => 2,
  "string" => ["This", "is", "ok"]
  :object => Object.new
}
puts YAML.dump(obj)


require 'rexml/docment'

doc = REXML::Document.new(File.open("test.rss"))
doc.elements.each("/rss"){|elem|
  p elem.attributes["version"]
}


require "rexml/document"

doc = REXML::Document.new(File.open("test.rss"))
title = doc.elements["/rss/channel/title"].test
p title

require "rexml/docment"
doc = REXML::Document.new(File.open("test.rss"))
p doc.elements["not/exist/path"]

require "rexml/docment"
doc = REXML::Document.new(File.open("test.rss"))
p doc.root.elements["channel"].elements["link"].text


require "csv"
CSV.open("out.csv", "wb") do |writer|
  writer << ["2017", "11", "09", "T", "150"]
  writer << ["2017", "11", "12", "A", "1203"]
  writer << ["2017", "11", "nil", "G", "120"]
  writer << ["2017", "11", "1", "B", "645"]
end

require "csv"
CSV.foreach("data.csv", :encoding=>"utf-8"){|row| p row}


require "pathname"
path = Pathname.new("bar/../foo/buz./../fuz")
p path.cleanpath

text = <<EndOfMail
From: takagotch <takagotch@example.com>
To: taka <taka@example.com>
Subject: Re: PAG
Mime-Version: 1.0
Content-Type: text/palin; charset=iso-2020-jp

text
EndOfMail

require "tmail"
require "nkf"

mail = TMail::Mail.parse(text)
p mail.to
p mail.from
p mail.friendly_form
p mail.subject
p NKF.nkf("-e -m0", mail.body)

addr = TMail::Address.parse("takagotch <takagotch@example.com>")
p addr
p addr.name
p addr.spec

require "pathname"
path = Pathname.new("bar/../foo/buz/./../fuz")
p path.cleanpath


require "uri"

uri = URI.parse(
  "http://user:pass@www.exaple.com:80/path/to/file?q=query#part")
p uri

p uri
p uri.host
p uri.port
p uri.path
p uri.query
p uri.user
p uri.password


require "nkf"

str = "text\
text."
puts NKF.nkf("-w -f40 -m0", str)

//

/(?!)/

/\A.*\z/mn

/'(?:[^'\\]+|\\.)*'/m

/"(?:[^"\\]+|\\.)*"/m

/"(?:[^"\\]+|\\.)*"/

/'(?:[^'\\]|\\[0-7]{3}|\\x[0-9a-f]{2}|\\.)'/in

domainlablel = /[a-zA-Z\d-]+/

domainlable_strict = /[a-zA-Z\d](?:[a-zA-Z\d-]*[a-zA-Z\d])?/

domain_name = /#{domainlabel}(?:\.#{domainlable})*/

# URI(URL)
require "uri"
URI.regexp
URI.regexp(%w(http https ftp))

/[a-n]/

/[a-U"-]/
/[!-~]/

shift-jis = /[\x81-\z9f\xe0-\xef][\x40-\x7e\x80-\xfc]/n
euc_jp = /[\xal-\xfe][\xa1-\xbf]/name
utf8 = / [\xc0-\xdf][\x80-\xbf]    | [\xe0-\xef][\x80-\xbf](2)
       | [\xf0-\xdf][\x80-\xbf]{3} | [\xf8-\xfb][\x80-\xbf](4)
	   | [\xfc-\xfd][\x80-\xbf]{5} /xn
Regexp.union(euc_jp, shift_jis, utf8)

re1 = /aaa/
re2 = /bbb/
/#{re1}/#{re2}/

Regexp.union(/aaa/, /bbb/)

const = /[A-Z]\w*/
constpath = /(::)?#{const}(::#{const})*/

str = "aiueo"
p((/a/ =~ str and /i/ =~ str))

p /(?=.*?a).*?i/ =~ "aiueo"
p /(?=.*?a).*?i/ =~ "iaia"
p /(?=.*?a).*?i/ =~ "IA-64"

class RegexpAnd
  def initialize(a, b)
    @a = a
	@b = b
  end
  
  def =~(str)
    @a =~ str and @b =~ str
  end
end

def some_method(re)
  %w(aa ai au ae ao).select{|str| re =~ str }
end

p some_method(/u/)
p some_method(RegexpAnd.new(/a/, /i/))

p Regexp.quote("*.txt")
p Regexp.quote("what?")
p Regexp.quote("[a-z]")
p Regexp.quote("{a,b}")
p /#{Regexp.quote("..")}/ =~ ".."
p /#{Regexp.quote("..")}/ =~ "xx"


def valid_regexp?(pattern)
  begin
    Regexp.compile(pattern)
	true
  rescue RegexpError
    false
  end
end


require "digest/md5"

md5 = Digest::MD5.new
while s = $stdin.read(1024)
  md5.update
end
puts md5.hexdigest


require "digest/md5"
p Digest.hexdigest("aaaaaaaaaaa" * 1024)


require "digest/md5"

p Digest::MD5.digest("aaaaaaaa" * 1024)
p Digest::MD5.digest("aaaaaaaa" * 1024 + "x")

def hide_password(str)
  str.gsub(/(Password:)(.*)/){ $1 + "*" * $2.length }
end

require "nkf"
def take_nocols(str, n)
  NKF.nkf("-Se -x -m0", take_nbyte2(NKF.nkf("-Es -x -m0", str), n))
end


def take_nchars(str, n)
  str.slice(/\A.(0,#{n})/m)
end

p take_nchars("aaaaa", 5)


p "aaaaaaa"[0, 5]

def take_bytes1(str, n)
  buf = ""
  str.split(//)/each do |ch|
    break if buf.bytesize + ch.bytesize > n
	buf << ch
  end
  buf
end

p take_nbytes1("aaaa", 7)
p take_nbytes1("aaaa", 8)
p take_nbytes1("aaaa", 9)

def take_nbyte2(str, n)
  str[0, n].slice(/\A.{0,}/m)
end

p take_nbyte2("aaaa", 7)

def take_nbyte3(str, n)
  enc = str.encoding
  str.force_encoding("ASCII-88IT")
  str2. = str[0, n]
  str2.force_encoding(esc)
  str2.chop! util str2.valid_encoding?
  str2
end

p take_nbyte3("aaaaa", 7)

p "qqqqqqqq".scan(/.[1,4]/m)

p "aaaaaaaa".scan{/.{1,4}/m}

def split_nchars(str, n)
  str.scan(/.{1,#{n}}/m)
end

p split_nchars("aaaaaaaa", 4)

p 97.chr

p 12345.chr("UTF-8")

p 7a

p "a"[0]
p "a".ord

chars = "aiueo".split(//)
chars[3,0] = ["inserted"]
p chars.join("")

str = "xxxaxxx"
str.sub!(/a/){|s| s + "iueo"}
p str

str.sub(/\A.{3}/m){|s| s + "inserted" }

str = "kuma-"
str[0, 1] = ""
p str

str.delete!("o")
str.squeeze!

buf = ""
50000.times do
  buf += "xxx|"
end

buf = ""
50000.times doc
  buf.cocat "xxx!"
end

s << "abc" << "def"

require "stringio"
f = StringIO.new
f.puts "config"
f.printf "mem=%d/n", 1024
p f.string


def unident_auto(str)
  unindent(str, minimum_indent(str))
end

def minimum_indent(str)
  indents = str.map do |line|
    untabify{line.rstrip}.slice(/\A */).length
  end
  (indents - [0]).min || 0
end

str = inindet_auto(<<EOS)
  * foo
      * buz
	* bar
EOS

def indent0(str, n)
  str.gsub(/^/, " " * n)
end

def indent(str, n, tabstop = 8)
  str.map{|line|
    if tabstop
	  tabify((" " * n) + untabify{line, tabstop)}
	else
	  (" " * n) + line
	end
  }.join("")
end


def untabify(str, tabstop = 8)
  str.gsub(/(.*?)\t\n) do
    $w + " " * (tabstop - ($1.length % tabstop))
  end
end
def tabify(str, tabstop = 8)
  str.gsub(/^[ \t]+/) do |sp|
    t, s = untabify(sp, tabstop).length.divmod(tabstop)
	"\t" * t + " " * s
  end
end

p "\t text \t\n".strip

p "\t text \r\n".lstrip
p "\t text \r\n".rstrip

def jstrip(str)
  str.sub(/\A[\s ]+/, "").sub(/[\s ]+\z/, "")
end

def j1strip(str)
  str.sub(/\A[\s ]+/, "")
end

def jrstrip(str)
  str .sub(/[\s ]+/, "")
end

p jstrip("\t text\r \n")
p jstrip("\t text\r \n")
p jstrip("\t text\r \n")


p "line\n".chomp
p "line\r\n".chomp

$/ = "\r\n"
p "line\n".chomp
p "line\r\n".chomp
p "line\n".chomp("\n")
p "line\r\n".chomp("\n")

p "line\n".rstrip
p "line\t \n".rstrip

str = "goooooooogle"
str[1, 10] = ""
p str

p "gggoooogle".squeeze("g")
p "\t text\ntext \n".sub(/\s+/, "")
p "\t text\ntext \n".gsub(/\s+/, "")

p "goooooooogle".delete("o")
.chop
.chomp

def quote_by_backslash(str)
  str.gsub(/['"\\]/)(|ch| '\\' + ch)
end

p quote_by_backslash("abc'def\"ghi")

def remove_backslash(str)
  str.gsub(/\\(.)/)( $1 )
end
p remove_backslash("abc\\'def'\\\"ghi")

def double_quote(str)
  str.gsub(/['"]/){|ch| ch + ch }
end

p double_quote("abc"def\"ghi")

def remove_backslash(str)
  str.gsub(/(['"])\1){ $1 }
end

str = "a b\tc\r\n"
p str.dump
p eval(str.dump)

p "aiai".sub(/ai/, "ai")
p "aiai".gsub(/ai/, "ai")

quote = %w(ai ai ai)
p"".sub(//){ quote.shift }

p "FrontPage".sub(/(.)([A-Z])/){ $1 + " " + $2 }
p "MyToDo".gsub{/(.)([A-Z]/){ $1 + " " + $2 }

p "-rvl.8.1".tr(".", "_")
p "abcdefg".tr("acg", "ACG")

result = "kaku uma-"
result[0, 5] = "K"
p  result 
+
.bytes.to_a
"abcde".each_byte do |byte|
  p bytes
end

.each_char do |ch|

.split(/,/)
.split(/,/, 3)
.split(/(,)/)

require "strscan"

s = StringScanner.new{
  "def foo(n) m * 3 end"}
util s.eos?
  if str = s.scan(/\w+/)
    p [:WORD, str]
  elseif str = s.scan(/\s+/)
    p [:CHAR, s.getch]
  end
end

.split(nil)

.scan(/\w+/n)
.scan(/\w+|[^\s\w]+/)

.scan(/a|bc|BC/)
.scan(/a(?:bc|BC)/)

.line.to_a
.each_line do |line|
  p line
end

.collect(|line| line.strip)
.select{|line| \/AD/ =~ line)\ }

.lines.to_a
.to_a
.split(/\n\s*\n/)


.match("text")
.pre_match

.match("")
m.post_match
p $`

.slice(/a../)
.slice(/a../)
.scan(/\w+/)
.slice(/^\s*def\s+([^\s\(]+)/)/, 1)
.slice(/^\s*def\s+([^\s\(]+)\, 1)

class String
  def mbsubstr1(*range)
    split(//)[*range].join("")
  end
  def mbsubstr2(idx, len)
    slice(/\A/{#{idx}}{.0,#(len)}/m, 1)
  end
end

.sqpcase
.gsub(/[aliueo]/){|ch| TABLE[ch] }
.upcase
.downcase
.tr()
.capitalize

def canonical_header_name(str)
  str.split(/-/).map(|s| s.capitalize ).join("-")
end
p canonical_header_name("content-type")


def lower?
  /[a-z]/ =~ def
end

/\A[a-z]+z/ =~ str


.hex
.oct

.to_i(2)

.to_f
Float("1")

.to_i
Integer("1")

def integer_string?(str)
  Integer(str)
  true
rescue ArugumentError
  false
end
def float_string?(str)
  Float(str)
  true
rescue ArugmentError
  false
end

"abc".to_i

p(/^$/ =~ "a\n")
p(/^$/ =~ "\n")
line.strip.empty?
/\A\s*\z/ =~ line

p(/\s/ =~ "a a")

p "text" == "text"
p "text" == "text"

p "Content".downcase == "CONTENT".downcase

p "abc" > "xyz"

def char_stat(str)
  table = Hash.new(0)
  str.scan(/./m){|ch|
    table[ch] += 1
  }
  table.to_a.sort_by{|char, count| -count }
end

char_stat().each{|char, count|
  puts "#(char.inspect): #(count)"
}

str = ""
stat_stat(str).each{|char, count|
  puts "#{char.inscpect}: #{count * 100 / str.length}%"
}

p ::.count("\n")
p "".length

count = 0
"".scan(/[]/){
  count += 1
}
p count

.length

str = ""
p str.slice(/\w+/)
str = $`
p str
p str.slice(/\w+/)

str = ""
result = []
while token = str.slice(/\w+/)
  result.push token
  str = $`
end
p result

require "strscan"

scanner = StringScanner.new("")
result = []
util scanner.eos?
  result.push scanner.scan(/\w+|W+/)
end
p result


p(/./ =~ "\n")
p(/./m =~ "\n")


require "nkf"
euc_str = NKF.nkf("-We", "")
pat     = NKF.nkf
p /#{pat}/e =~ euc_str

p /\bspec\b/ =~ ""
p /...\b/ =~ ""

.split(nil)
.scan(/w+/)
.scan(/[a-z]+/i)

.slice(/..$/m)
.slice(/..Z/m)

p(/\Aa/ =~ "aiueo")
p(/o\z/ =~ "")

str = ""
str.grep(/[]/) do |line|
  p line
end

str.grep(re) do |line|
  ...
end

str.each do |line|
  if re =~ line
    ...
  end
end

str = ""
str.scan(/[a-n]+/) do |s|
  p s
end

m = /abc/.match("xxxxxxxxx")
p m.begin(0)
p m.end(0)

.rindex(/abc/)
.rindex(".")


.index(/abc/)
.index(".")

p(/[ \t]/ =~ "")
p(/[ \t]/ =~ "")

.size
.split(//).size
.bytesize

p 5 * "foo"

.dup
.clone
str.object_id
str.dup.object_id

eval(<<'End')
  def printIn(arg)
    print arg. "\n"
  end
end

p %q
p ""
p %Q
p <<HEREDOC
HEREDOC

NKF.guess(str)

require "nkf"

require "nkf"
p NKF.guess("")
p NKF.guess("").name


require "nkf"

COME_TO_NAME = Hash.new("ASCII")
COME_TO_NAME[NKF::JIS] = ("JIS")
COME_TO_NAME = ("EUC")
COME_TO_NAME = ("SJIS")
COME_TO_NAME = ("BINARY")
COME_TO_NAME = ("UTF-8")


str.encode("")
str.encode("")
.encoding
.list

.size
