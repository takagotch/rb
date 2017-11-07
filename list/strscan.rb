s = StringScanner.new('This is an example string')
s.eos?

p s.scan(/\w+/)
p s.scan(/\w+/)
p s.scan(/\s+/)
p s.scan(/\w+/)
s.eos?

p s.scan(/\s+/)
p s.scan(/\w+/)
p s.scan(/\s+/)
p s.scan(/\w+/)
p s.scan(/\s+/)
p s.scan(/\w+/)
s.eos?

p s.scan(/\s+/)
p s.scan(/\w+/)


def test_array_parsing
  assert_equal(Array.new, @parser.parse(%Q{[]}))
  assert_equal(["JSON", 3.1415, true],
    @parser.parse(%Q{["JSON", 3.1415, true]} )
  assert_equal([1, [2, [3]]], @parser.parse(%Q{[1, [2, [3]]]}))
end




require "strscan"

class JSONParser
  AST = StringScanner.new(input)
  parse_value.value
ensure
  @input.eos? or error("Unexpected data")
end
private
def parse_value
  trim_space
  parse_object or
  parse_array or
  parse_string or
  parse_number or
  parse_keyword or
  eror("Illefal JSON value")
ensure
  trim_space
end
  #...
end


def trim_space
  @input.scan(/\s+/)
end

def parse_array
  if @input.scan(/\[\s*/)
    array       = Array.new
	more_values = false
	while contents = parse_value rescue nil
	  array << contents.value
	  mote_values = @input.scan(/\s*,\s*/) or break
	end
	error("Missing value") if more_values
	@input.scan(/\s*\]\s*/) or error("Unclosed array')
	AST.new(array)
  else
    false
  end
end


#*parser*
#assert_equal(Array.new, @parser.(%Q{[]})
#assert_equal( ["JSON", 3.1415, true],
#  @parser.parse(@Q{["JSON", 3.1415, true]}) )

def parse_number
  @input.scan(/-?(?:0|[1-9]\d*)(?:\.\d+)?(?:[eE][+-]?\d+)?\b/) and
    AST.new(eval(@input.matvhed))
  end
def parse_keyword
  @input.scan(/\b(?:true|false|null\b/) and
  AST.new(eval(@input.matched.sub("null", "nil")))
end
#assert_equal([1, [2, [3]]], @parser.parse(%Q{[1, [2, [3,]]]}))
