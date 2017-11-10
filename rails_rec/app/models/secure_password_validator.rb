class SecurePasswordValidator < ActiveModel::Validator
  def validate(record)
    if record.password.in? [record.name, "password", "hoge"]
	  record.errors[:base] << "text."
	end
  end
end