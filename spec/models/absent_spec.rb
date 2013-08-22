# == Schema Information
#
# Table name: absents
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  date_of_absence :date
#  creator_id      :integer
#  updater_id      :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'spec_helper'

describe Absent do
  pending "add some examples to (or delete) #{__FILE__}"
end
