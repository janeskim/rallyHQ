# == Schema Information
#
# Table name: committees
#
#  id         :integer          not null, primary key
#  api_id     :string
#  name       :string
#  phone      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class CommitteeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
