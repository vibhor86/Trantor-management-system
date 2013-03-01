require 'spec_helper'

describe "document_templates/show" do
  before(:each) do
    @document_template = assign(:document_template, stub_model(DocumentTemplate,
      :title => "Title",
      :body => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
  end
end
