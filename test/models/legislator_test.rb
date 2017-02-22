# == Schema Information
#
# Table name: legislators
#
#  id          :integer          not null, primary key
#  first_name  :string
#  last_name   :string
#  party       :string
#  title       :string
#  state       :string
#  chamber     :string
#  phone       :string
#  website     :string
#  address     :string
#  bioguide_id :string
#  govtrack_id :string
#  thomas_id   :string
#  in_office   :boolean
#  term_start  :datetime
#  term_end    :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class LegislatorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
