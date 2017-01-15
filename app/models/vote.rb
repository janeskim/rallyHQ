class Vote < ActiveRecord::Base
  # vote date -> bill["upcoming"]["legislative_day"]
  # vote -> bill["upcoming"]["chamber"]
end
