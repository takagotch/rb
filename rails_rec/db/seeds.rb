%w(text).each do |cat|
  Category.find_or_create_by_name(cat)
end

#rale db:migrate