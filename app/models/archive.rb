# == Schema Information
#
# Table name: archives
#
#  id                        :integer          not null, primary key
#  bill_id                   :integer
#  senate_cloture_result     :string
#  senate_cloture_result_at  :date
#  senate_passage_result     :string
#  senate_passage_result_at  :date
#  senate_override_result    :string
#  senate_override_result_at :date
#  house_passage_result      :string
#  house_passage_result_at   :date
#  house_override_result     :string
#  house_override_result_at  :date
#  vetoed                    :boolean
#  vetoed_at                 :date
#  active                    :boolean
#  active_at                 :date
#  awaiting_signature        :boolean
#  awaiting_signature_since  :date
#  enacted                   :boolean
#  enacted_at                :date
#  created_at                :datetime
#  updated_at                :datetime
#

class Archive < ActiveRecord::Base
  belongs_to :bill
end
