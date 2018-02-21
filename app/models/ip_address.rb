class IpAddress < ActiveRecord::Base

  # No validations, to record weird stuff, if it happens
  #  (also the address could be IP v. 4 or IP v. 6)

end
