# == Schema Information
#
# Table name: votes
#
#  id         :integer          not null, primary key
#  type       :string
#  number     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Vote < ActiveRecord::Base
  # vote date -> bill["upcoming"]["legislative_day"]
  # vote -> bill["upcoming"]["chamber"]
end
