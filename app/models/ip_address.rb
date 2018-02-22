class IpAddress < ActiveRecord::Base

  # No validations, to be able record weird stuff...
  #  (the address could be IP v. 4 or IP v. 6)

end
