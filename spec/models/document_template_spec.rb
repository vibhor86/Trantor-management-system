require 'spec_helper'

describe DocumentTemplate do
  before(:each) do
    create(:document_template)
  end
    
    it "should have a title" do
    no_template_title = build(:document_template, :title => "")
    no_template_title.should_not be_valid
  end
  
  it "should have a body" do
    no_template_body = build(:document_template, :body => "")
    no_template_body.should_not be_valid
  end
 
  it "should reject duplicate title" do
    template_with_duplicate_title = build(:document_template)
    template_with_duplicate_title.should_not be_valid
  end
  
  
 it "should save template" do
    template=build(:document_template, :title => "test", :body => "test")
    expect {template.save!}.to change{DocumentTemplate.count}.by(1)
  end
   
end
