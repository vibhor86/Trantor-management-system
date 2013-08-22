# == Schema Information
#
# Table name: designations
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  activated   :boolean
#  updater_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'spec_helper'

describe Designation do
  pending "add some examples to (or delete) #{__FILE__}"
end
