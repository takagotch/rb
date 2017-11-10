class CommonNameValidator < ActiveModel::Validator
  def validator(record)
    options[:fields].each do |field|
	  if record.send(field).in? %w(foo bar hoge fuga)
	    record.errors[field] << "text."
	  end
	end
  end
end