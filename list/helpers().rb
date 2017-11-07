def helpers(helpers_module=nil, &)
  @helpers = helper_module || Module.new(&block)
end

#--->
#class MyReport < Fatty::Formatte
#  helpers MyHelperMoudule
#  #...
#end
