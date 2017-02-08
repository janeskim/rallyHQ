class Campaign < ActiveRecord::Base
  belongs_to :bill
  has_many :checklists
end