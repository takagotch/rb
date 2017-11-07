def render(format, params={})
  validate(format, params)
  
  format_obj = format[format].new
  format_obj.extend(@helper) if @helper
  format_obj.params = params
  format_obj.validate
  format_obj.render
end
