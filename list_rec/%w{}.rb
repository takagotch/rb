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