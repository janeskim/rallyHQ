# == Schema Information
#
# Table name: checklists
#
#  id          :integer          not null, primary key
#  campaign_id :integer
#  title       :string
#  created_at  :datetime
#  updated_at  :datetime
#

class Checklist < ActiveRecord::Base
  belongs_to :campaign
  has_many :actions
end
