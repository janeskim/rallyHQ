class Legislator < ActiveRecord::Base
  has_and_belongs_to_many :bills
  has_many :actions
end