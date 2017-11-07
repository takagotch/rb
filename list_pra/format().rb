def format(name, options={}, &block)
  format[name] = Class.new(options[:base] || Fatty::Format, &block)
end
