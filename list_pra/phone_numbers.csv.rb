applicant,phone_number,spouse,phone_number
James Gray,555 555 5555,Dana Gray,123 456 7890
Gregory Brown,098 4321,Jia Wu,222 222 2222

>>data = CSV.read("phone_number.csv", :headers => true)
=> #<CSV::Table mode:col_or_row row_count:3>
>> data.map{ |r| r["phone_number"], r["phone_number"] }
=> [["555 555 5555", "123 456 7890"],["098 765 4321", "222 222 2222"]]

>>data.map{ |r| [ r["phone_number", r.index("applicant")],
?>              r["phone_number", r.index("spouse")] ]}
=> [["555 555 5555", "123 456 7890"], ["098 765 4321", "222 222 2222"]]

name,total payments
Gregory Brown,225
Joe Comfort,150
Jon Juraschka,450
Jia Wi,100



requrie "csv"

@totals = Hash.new(0)

csv_options = {:headers => true, :converters => :numeric }

CSV.foreach("payments.csv", "w") do |csv|
  csv << ["name", "total payments"]
  @totals.each{ |row| csv << row }
end
