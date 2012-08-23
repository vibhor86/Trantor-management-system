require 'spec_helper'

describe "DocumentTemplates" do
  
  before do
    @user = create(:user)
    visit root_path
    fill_in "Email", :with => @user.email
    fill_in "Password", :with => @user.password
    click_button "Sign in"
     @template=create(:document_template)
    #    @placeholder=create(:placeholder, document_template: @template)
  end
  
    describe "GET /document_templates" do
  
      before(:each) do
        visit document_templates_path
      end
  
      it "displays document templates" do
        page.should have_content("Testing template") #using capybara
      end
  
      it "display document template for editing" do
        visit edit_document_template_path(:id => 1)
        click_button "Update Document template"
        page.should_not have_content('error')
      end
  
#      it "show document template" do
#        click_link "Show"
#        visit document_template_path(:id => 1)
#        page.should have_content('Testing template')
#        page.should have_content('Hi this is a sample template')
#        page.should have_link('Edit')
#        page.should have_link('Back')
#      end
    end
  
    def fill_in_ckeditor(locator, opts)
      browser = page.driver.browser
      content = opts.fetch(:with).to_json
      browser.execute_script <<-SCRIPT
      CKEDITOR.instances['#{locator}'].setData(#{content});
    $('textarea##{locator}').text(#{content});
  SCRIPT
    end
  
    describe "POST /document_templates" , :js => true do
      it "create document template" do
        visit new_document_template_path
        fill_in "Title", :with => "test"
        fill_in_ckeditor "document_template_body", :with => "test_body"
        click_button "Create Document template"
        page.should have_content("Document template was successfully created.")
        page.should have_content("test")
     end
    end
  
    describe "PUT /document_templates" do
     it "document template for updating" do
        click_link "Edit"
        visit edit_document_template_path(:id => 1)
       click_button "Update Document template"
       page.should_not have_content('error')
        redirect_to document_templates_path
       page.should have_content("Document template was successfully updated.")
      end
  end
  
#  describe "DELETE /document_templates", :js => true do
#    before(:each) do
#      visit document_templates_path
#      save_and_open_page
#      click_link "Destroy"
#
#      #        alert =page.driver.browser.switch_to.alert rescue Selenium::WebDriver::Error::NoAlertOpenError
#      #        p alert
#      #        p alert.text
#      #         if (alert.text == "Are you sure?")
#      #
#      #         end
#       page.driver.browser.switch_to.alert.text.should == 'Are you sure?'
#      page.driver.browser.switch_to.alert.accept
#      save_and_open_page
#    end
#
#    it "document template for accept deleting" do
#      #        page.driver.browser.switch_to.alert.accept
#      save_and_open_page
#    end
#
#    #      it "document template for dismiss deleting" do
#    #        page.driver.browser.switch_to.alert.dismiss
#    #        save_and_open_page
#    #      end
#  end
end


