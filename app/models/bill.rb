# == Schema Information
#
# Table name: bills
#
#  id             :integer          not null, primary key
#  vote_id        :string
#  short_title    :string
#  api_id         :string
#  bill_type      :string
#  number         :string
#  chamber        :string
#  debate_chamber :string
#  introduced_on  :date
#  last_action_at :date
#  debate_at      :date
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Bill < ActiveRecord::Base
  has_and_belongs_to_many :legislators
  has_and_belongs_to_many :committees
  has_one :archive
  has_many :campaigns
end
