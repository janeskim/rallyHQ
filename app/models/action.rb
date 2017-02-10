# == Schema Information
#
# Table name: actions
#
#  id            :integer          not null, primary key
#  legislator_id :integer
#  checklist_id  :integer
#  category      :string
#

class Action < ActiveRecord::Base
  belongs_to :checklist
  belongs_to :legislator

  has_many :activities
  has_many :users, through: :activities
end
