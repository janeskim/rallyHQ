# == Schema Information
#
# Table name: scripts
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#

class Script < ActiveRecord::Base
  belongs_to :campaign
end
