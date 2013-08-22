# == Schema Information
#
# Table name: preferences
#
#  id                    :integer          not null, primary key
#  user_id               :integer
#  lta                   :boolean
#  medical_reimbursement :boolean
#  pf_enrollment_date    :date
#  gpa                   :boolean
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

require 'spec_helper'

describe Preference do
  pending "add some examples to (or delete) #{__FILE__}"
end
