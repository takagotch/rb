# coding: UTF-8
utf8_string = "foo あ bar"
sjis_string = utf8_string.encoding("Shift_JIS")

p utf8_string == sjis_string


sjis_string =~ /(\+w)\sあ\s(/w+)/
encoding_test.rb:6:in '<main>': incompatible encoding regexp match
(UTF-8 regexp with Shift_JIS string) (Encoding::CompatibilityError)

utf8_string << sjis_string
encoding_test.rb:6:in '<main>' : incompatible character encodings:
UTF-8 and Shift_JIS (Encoding::CompatibilityError)

def sjis_re(str)
  Regexp.new(str.encoding("Shift_JIS"))
end

sjis_string =~ sjis_re("(\w+)\sあ\s(\w+)")
p [$1, $2]

def encoding_re(*chunks)
  Regexp.new(encoding_str(*chunks))
end

def encoding_str(*chunks)
  chunks.map { |chunk| chunk.encode(@encoding.name) }.join
end

# coding: UTF-8
require "csv"
CSV.read("data.csv", encoding: "Shift_JIS")

def escape_re(str)
  str.chars.map { |c| @re_chars.include?(c) ? @re_esc + c : c }.join
end


@re_chars = %w[ \\ . [ ] - ^ $ ?
                * + { } ( ) | #
				\ \r \n \t \f \v].
			map { |s| s.encode(@encoding) rescue nil }.compact
	

def init_parsers(options)
  @skip_blanks = options.delete(:skip_blanks)
  @field_size_limit = options.delete(:field_size_limit)
  #
  esc_col_sep = escape_re(@clo_sep)
  esc_row_sep = escape_re(@row_sep)
  esc_quote   = escape_re(@quote_char)
  @parsers = {
    leading_fields:encode_re("\\A(?:", esc_col_sep, ")+"),
	csv_row: encode_re(
	  "\\G(?:\\A|", esc_col_sep, ")",
	  "(?:",,esc_quote,
	     "((?>[^", esc_quote, "]*)",
		 "(?>", esc_quote * 2,
		 "[^", esc_quote, "]*)*)",
		 esc_quote,
		 "|",
		 "([^", esc_quote, esc_col_sep, "]*))",
	  "(?=", esc_col_sep, "|\\z)"
	),
	bad_field: encode_re(
	  "\\A", esc_col_sep, "?",
	  "(?:", esc_quote,
         "((?>[^", esc_quote, "]*)",
		 "(?>", esc_quote * 2,
		 "[^", esc_quote, "]*)*)",
		 esc_quote,
		 "[^", esc_quote, "]",
		 "|",
		 "([^", esc_quote, esc_col_sep, "]+",
	  esc_quote, ")"
	),
	line_end: encode_re(esc_row_sep, "\\z")
	return_newline: encode_str("\r\n")
  }
end



#coding: UTF-8
require "csv"
CSV.read("data.csv", encoding: "Shift_JIS", col_sep: "▲")  

#file
#ruby -e file.read("foo.txt", encoding:"ISO-8859-1:UTF-8")
File.open("foo.txt", "w:ISO-8859-1:UTF-8"){ |f| f << data + "Some extra text" }
data = File.read("foo.txt", encoding: "UTF-8")
File.open("foo.txt", "w:UTF-8"){ |f| f << data + "Some extra text" }
img_data = File.readr("foo.png")
img_data = File.binread
img_data.encoding

class Prawn_file(filename)
  #...
  def render_file(filename)
    file.open(filename, "wb") { |f| f << render }
  end
end

#coding: iso-8859-1
require "prawn"
Prawn::Document.generate("output.pdf", :page_size => "LEGAL") do
  stroke_line [100,100], [200,200]
end

def text(text,option={})
  text - text.to_s.dup
  save_font do
    options = text_options.merge(options)
    process_text_options(options)
	font.normalize_encoding(text) unless @skip_encoding
  end
end

module Prawn
  class Font
    class TTF < Font
	  def notmalize_encoding(text)
	    text.encoding("UTF-8")
	  end
	end
  end
end

