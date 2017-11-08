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

