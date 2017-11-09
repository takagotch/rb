domain_part = /[a-zA-z0-9][a-zA-Z0-9.-]+/
local_part = /[a-zA-Z0-9_\#!$%&`'*+\-{|}~^\/=?\.]+/
VALID_ADDRESS = /\A#{local_part}@#{domain_part}\z/n

def valid_email_address?(str)
  return false if /\s/ =~ str
  return false if /{ -Z}/ =~ str
  VALID_ADDRESS =~ str
end




require 'jpmobile'

p Jpmobile::Email.detect('example@docomo.ne.jp')
p Jpmobile::Email.detect('example@ezweb.ne.jp')
p Jpmobile::Email.detect('example@softbank.ne.jp')
