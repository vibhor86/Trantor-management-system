# == Schema Information
#
# Table name: holidays
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  date        :datetime
#  day         :string(255)
#  remark      :text
#  updater_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'spec_helper'

describe Holiday do
  pending "add some examples to (or delete) #{__FILE__}"
end
