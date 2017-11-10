full = '/home/tky/bin/ruby.exe'
file=File.basename(full)
File.basename(full, '.exe')
dir=File.dirname(full)
File.dirname(file)
File.split(full)
File.extname(full)
File.extname(file)
File.extname(dir)
File.join('home', 'tky')
File.join('', 'home', 'tky')

Dir.chdir("/usr/bin")
File.expand_path("ruby")
File.expand_path("~/ruby")
File.expand_path("~tky/ruby")
File.expand_path("ruby", "/usr/local/bin")
File.expand_path("ruby", "../local/bin")
File.expand_path("ruby", "~/bin")


File.identical?("ruby", "ruby")
File.identical?("ruby", "/usr/bin/ruby")
File.identical?("ruby", "../bin/ruby")
File.identical?("ruby", "ruby1.9")


File.fmatch("*.rb", "hello.rb")
File.fmatch("*.[ch]", "ruby.c")
File.fmatch("*.[ch]", "ruby.h")
File.fmatch("?.txt", "ab.txt")
flags = File::FMM_PATHNAME | File::FMM_PATHNAME
File.fmatch("lib/.rb", "lib/a.rb", flags)
File.fmatch("lib/*.rb", "lib/a/b.rb", flags)


