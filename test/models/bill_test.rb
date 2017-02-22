# == Schema Information
#
# Table name: bills
#
#  id             :integer          not null, primary key
#  vote_id        :string
#  short_title    :string
#  api_id         :string
#  bill_type      :string
#  number         :string
#  chamber        :string
#  debate_chamber :string
#  introduced_on  :date
#  last_action_at :date
#  debate_at      :date
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class BillTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
