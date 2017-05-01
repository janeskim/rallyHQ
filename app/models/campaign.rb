# == Schema Information
#
# Table name: campaigns
#
#  id           :integer          not null, primary key
#  bill_id      :integer
#  is_active    :boolean
#  email_date   :datetime
#  published_at :datetime
#  expires_at   :datetime
#  created_at   :datetime
#  updated_at   :datetime
#

class Campaign < ActiveRecord::Base
  belongs_to :bill
  has_many :checklists
  has_many :scripts
end
