require 'spec_helper'

describe LeavemanagementsController do

  def mock_leavemanagement(stubs={})
    (@mock_leavemanagement ||= mock_model(Leavemanagement).as_null_object).tap do |leavemanagement|
      leavemanagement.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all leavemanagements as @leavemanagements" do
      Leavemanagement.stub(:all) { [mock_leavemanagement] }
      get :index
      assigns(:leavemanagements).should eq([mock_leavemanagement])
    end
  end

  describe "GET show" do
    it "assigns the requested leavemanagement as @leavemanagement" do
      Leavemanagement.stub(:find).with("37") { mock_leavemanagement }
      get :show, :id => "37"
      assigns(:leavemanagement).should be(mock_leavemanagement)
    end
  end

  describe "GET new" do
    it "assigns a new leavemanagement as @leavemanagement" do
      Leavemanagement.stub(:new) { mock_leavemanagement }
      get :new
      assigns(:leavemanagement).should be(mock_leavemanagement)
    end
  end

  describe "GET edit" do
    it "assigns the requested leavemanagement as @leavemanagement" do
      Leavemanagement.stub(:find).with("37") { mock_leavemanagement }
      get :edit, :id => "37"
      assigns(:leavemanagement).should be(mock_leavemanagement)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created leavemanagement as @leavemanagement" do
        Leavemanagement.stub(:new).with({'these' => 'params'}) { mock_leavemanagement(:save => true) }
        post :create, :leavemanagement => {'these' => 'params'}
        assigns(:leavemanagement).should be(mock_leavemanagement)
      end

      it "redirects to the created leavemanagement" do
        Leavemanagement.stub(:new) { mock_leavemanagement(:save => true) }
        post :create, :leavemanagement => {}
        response.should redirect_to(leavemanagement_url(mock_leavemanagement))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved leavemanagement as @leavemanagement" do
        Leavemanagement.stub(:new).with({'these' => 'params'}) { mock_leavemanagement(:save => false) }
        post :create, :leavemanagement => {'these' => 'params'}
        assigns(:leavemanagement).should be(mock_leavemanagement)
      end

      it "re-renders the 'new' template" do
        Leavemanagement.stub(:new) { mock_leavemanagement(:save => false) }
        post :create, :leavemanagement => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested leavemanagement" do
        Leavemanagement.should_receive(:find).with("37") { mock_leavemanagement }
        mock_leavemanagement.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :leavemanagement => {'these' => 'params'}
      end

      it "assigns the requested leavemanagement as @leavemanagement" do
        Leavemanagement.stub(:find) { mock_leavemanagement(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:leavemanagement).should be(mock_leavemanagement)
      end

      it "redirects to the leavemanagement" do
        Leavemanagement.stub(:find) { mock_leavemanagement(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(leavemanagement_url(mock_leavemanagement))
      end
    end

    describe "with invalid params" do
      it "assigns the leavemanagement as @leavemanagement" do
        Leavemanagement.stub(:find) { mock_leavemanagement(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:leavemanagement).should be(mock_leavemanagement)
      end

      it "re-renders the 'edit' template" do
        Leavemanagement.stub(:find) { mock_leavemanagement(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested leavemanagement" do
      Leavemanagement.should_receive(:find).with("37") { mock_leavemanagement }
      mock_leavemanagement.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the leavemanagements list" do
      Leavemanagement.stub(:find) { mock_leavemanagement }
      delete :destroy, :id => "1"
      response.should redirect_to(leavemanagements_url)
    end
  end

end
