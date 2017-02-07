class Action < ActiveRecord::Base
  belongs_to :checklist

  has_many :activities
  has_many :users, through: :activities
end