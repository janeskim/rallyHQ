class Checklist < ActiveRecord::Base
  belongs_to :campaign
  has_many :actions
end