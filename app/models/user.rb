# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string           default(""), not null
#  email           :string           default(""), not null
#  password_digest :string           default(""), not null
#  state           :string
#  zipcode         :string
#  is_active       :boolean
#  is_admin        :boolean
#  last_login      :datetime
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
  has_secure_password

  has_many :activities
  has_many :actions, through: :activities
end
