# == Schema Information
#
# Table name: committees
#
#  id         :integer          not null, primary key
#  api_id     :string
#  name       :string
#  phone      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Committee < ActiveRecord::Base
  has_and_belongs_to_many :bills
  has_and_belongs_to_many :legislators
end
