class Bill < ActiveRecord::Base
  has_and_belongs_to_many :legislators
  has_and_belongs_to_many :committees
end
