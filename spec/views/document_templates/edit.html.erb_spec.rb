require 'spec_helper'

describe "document_templates/edit" do
  before(:each) do
    @document_template = assign(:document_template, stub_model(DocumentTemplate,
      :title => "MyString",
      :body => "MyText"
    ))
  end

  it "renders the edit document_template form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => document_templates_path(@document_template), :method => "post" do
      assert_select "input#document_template_title", :name => "document_template[title]"
      assert_select "textarea#document_template_body", :name => "document_template[body]"
    end
  end
end
