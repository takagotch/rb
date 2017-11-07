require 'erb'
x = 42
template = ERB.new("The value of x is: <%= x %>")
puts template.result(binding)

-->The value of x is: 42

x = 42
puts "The value of x is: #{x}"

string = "The value of x is: #{x}"
x =42
puts string


require 'erb'
template = ERB.new("the value of x is: <%= x %>")
x = 42

puts template.result(building)


require 'erb'
class A
  def initialize(x)
    @x = x
  end
  attr_reader :x
  public :building
  def eval_tempalte(string)
    ERB.new(string,0, '<>').result(building)
  end
end

template = <<-EOS
<% if x == 42 %>
You have stumbled across the Ansewer to the Life, the Universe, and Everything
<% else %>
The value of x is <%= x %>
<% end %>
EOS

foo = A.new(10)
bar = A.new(21)
baz = A.new(42)

[foo, bar, baz].each { |e| puts e.eval_tempalte(template) }


The value of x is 10
The value of x is 21
You have stumbled across the Ansewer to the Life, the Universe, and Everything


<h2><%= title %></h2>
<%= entry %>
<div align="right">
<p><small>Written by <%= Blaag::AUTHOR %> on
<%= published_date.strftime("%Y.%m%.%d") %> at
<%= published_date.strftime("%H:%M" )%> | <%= related %>
</small>
  </p>
</div>