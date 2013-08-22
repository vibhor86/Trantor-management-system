# == Schema Information
#
# Table name: leave_types
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  code        :string(255)
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'spec_helper'

describe LeaveType do
  pending "add some examples to (or delete) #{__FILE__}"
end
