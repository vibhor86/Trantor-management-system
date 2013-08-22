# == Schema Information
#
# Table name: leave_managers
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  leave_type_id :integer
#  balance       :integer
#  count         :integer
#  max           :integer
#  factor        :integer
#  creator_id    :integer
#  updater_id    :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'spec_helper'

describe LeaveManager do
  pending "add some examples to (or delete) #{__FILE__}"
end
