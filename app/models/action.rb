class Action < ActiveRecord::Base
  belongs_to :checklist
  belongs_to :legislator

  has_many :activities
  has_many :users, through: :activities
end