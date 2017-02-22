# == Schema Information
#
# Table name: activities
#
#  id         :integer          not null, primary key
#  action_id  :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Activity < ActiveRecord::Base
  belongs_to :action
  belongs_to :user
end
