require 'spec_helper'

describe "document_templates/new" do
  before(:each) do
    assign(:document_template, stub_model(DocumentTemplate,
      :title => "MyString",
      :body => "MyText"
    ).as_new_record)
  end

  it "renders new document_template form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => document_templates_path, :method => "post" do
      assert_select "input#document_template_title", :name => "document_template[title]"
      assert_select "textarea#document_template_body", :name => "document_template[body]"
    end
  end
end
