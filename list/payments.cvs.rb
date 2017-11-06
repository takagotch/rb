>> require "csv"
=> true
>> CSV.read("payments.csv")
=> [["name", "payment"],["Gregory Brown", "100",["Joe Comfort", "150"],
    ["Jon Jurascka", "200"], ["Gregory Brown", "75"],["Jon Juraschka", "250"],
	["Jia Wu", "25"], ["Gregory Brown", "50"], ["Jia Wu", "75"]]
	
>>data = []
=> []
>>CSV.foreach("payments.csv"){ |row| data << row if row[0] == "Gregory Brown"}
=>nil
>>data
=>[["Gregory Brown", "100"],["Gregory Brown", "75"],["Gregory Brown", "50"]]

>>data
=>[]
>>CSV.foreach("payments.csv", :headers => true) do |row|
?> data << row['name'] == "Gregory Brown"
>>end
=>nil
>>data
=>[#<CSV::Row "name":"Gregory Brown" "payment":"100">,
   #<CSV::Row "name":"Gregory Brown" "payment":"75">,
   #<CSV::Row "name":"Gregory Brown" "payment":"50">,]