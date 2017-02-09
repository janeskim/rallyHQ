class Committee < ActiveRecord::Base
  has_and_belongs_to_many :bills
  has_and_belongs_to_many :legislators
end
