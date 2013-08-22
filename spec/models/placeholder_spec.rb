# == Schema Information
#
# Table name: placeholders
#
#  id               :integer          not null, primary key
#  column_name      :string(255)
#  placeholder_name :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'spec_helper'

describe Placeholder do
 before(:each) do
    create(:placeholder)
  end
  
  it "should have a column_name" do
    no_template_column_name = build(:placeholder, :column_name => "")
    no_template_column_name.should_not be_valid
  end
  
  it "should have a placeholder_name" do
    no_template_placeholder_name = build(:placeholder, :placeholder_name => "")
    no_template_placeholder_name.should_not be_valid
  end
 
  it "should reject duplicate column_name" do
    template_with_duplicate_column_name = build(:placeholder)
    template_with_duplicate_column_name.should_not be_valid
  end
  
  it "should reject duplicate placeholder_name" do
    template_with_duplicate_placeholder_name = build(:placeholder)
    template_with_duplicate_placeholder_name.should_not be_valid
  end
  
end
