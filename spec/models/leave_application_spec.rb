# == Schema Information
#
# Table name: leave_applications
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  leave_type_id :integer
#  start_date    :date
#  end_date      :date
#  reason        :text
#  approved      :boolean
#  creator_id    :integer
#  updater_id    :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'spec_helper'

describe LeaveApplication do
  pending "add some examples to (or delete) #{__FILE__}"
end
