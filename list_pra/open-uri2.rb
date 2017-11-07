require "open-uri"

puts open("http:www.ruby-lang.org/en/LICENSE.txt").read

>>open("http://majesticseacreature.com/a_totally_missing_ducument")

>>open("http://prism.library.cornell.edu/control/authBasic/suthTest")

>>open("http://prism.library.cornell.edu/control/authBasic/suthTest",
?>     :http_basic_authentication => ["test", "this"])


open("ftp//ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p0.tar.bz2") do |o|
  File.open(File.basename(o.base_uri.path), "w'){ |f| f << o.read }
end

Prawn::Document.generate("remote_image.pdf") do
  image open("http://prawn.majesticseacreature.com/media/prawn_log.png")
end

