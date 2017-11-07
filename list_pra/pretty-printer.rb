#p
friends = [{ first_name: "Emily", last_name: "Laskin" },
           { first_name: "Nick", last_name: "Mauro" },
           { first_name: "Mark", last_name: "Maxwell" },]
		  
me = { first_name: "Gregory", last_name: "Brown", friends: friends }

p me


#pp
require "pp"

friends = [{ first_name: "Emily", last_name: "Laskin" },
           { first_name: "Nick", last_name: "Mauro" },
           { first_name: "Mark", last_name: "Maxwell" },]
		
me = { first_name: "Gregory", last_name: "Brown", friends: friends }

pp me

#pp1
require "pp"

class Person
  def iitialize(first_name, last_name, friends)
    @first_name, @last_name,@friends = first_name, last_name, friends
  end
  
  def pretty_print(printer)
    printer.text "Person <#{object_id}>:\n" <<
	             " Name: #@first_name #@last_name\n Friends:\n"
    @friends.each do |f|
      printer.text "     #{f[:first_name]} #{f[:last_name]}\n"	
    end
  end

end 

friends = [{ first_name: "Emily", last_name: "Laskin" },
           { first_name: "Nick", last_name: "Mauro" },
           { first_name: "Mark", last_name: "Maxwell" },]

person = Person.new("Gregory", "Brown", friends)
pp person

Person <1012900>:
  Name: Gregory Brown
  Friends:
    Emily Laskin
	Nick Masuo
	Mark Maxwell
	
class Person#
  alias_method :inspect, :pretty_print_inspect
end
