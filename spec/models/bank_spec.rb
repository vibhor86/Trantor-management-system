# == Schema Information
#
# Table name: banks
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  code           :string(255)
#  address        :text
#  ifsc_code      :string(255)
#  contact_person :string(255)
#  contact_number :string(255)
#  activated      :boolean
#  updater_id     :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'spec_helper'

describe Bank do
  pending "add some examples to (or delete) #{__FILE__}"
end
