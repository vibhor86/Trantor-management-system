# == Schema Information
#
# Table name: bands
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  updater_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'spec_helper'

describe Band do
  pending "add some examples to (or delete) #{__FILE__}"
end
