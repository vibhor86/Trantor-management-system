require 'spec_helper'

describe LeaveConfigsController do

  def mock_leave_config(stubs={})
    (@mock_leave_config ||= mock_model(LeaveConfig).as_null_object).tap do |leave_config|
      leave_config.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all leave_configs as @leave_configs" do
      LeaveConfig.stub(:all) { [mock_leave_config] }
      get :index
      assigns(:leave_configs).should eq([mock_leave_config])
    end
  end

  describe "GET show" do
    it "assigns the requested leave_config as @leave_config" do
      LeaveConfig.stub(:find).with("37") { mock_leave_config }
      get :show, :id => "37"
      assigns(:leave_config).should be(mock_leave_config)
    end
  end

  describe "GET new" do
    it "assigns a new leave_config as @leave_config" do
      LeaveConfig.stub(:new) { mock_leave_config }
      get :new
      assigns(:leave_config).should be(mock_leave_config)
    end
  end

  describe "GET edit" do
    it "assigns the requested leave_config as @leave_config" do
      LeaveConfig.stub(:find).with("37") { mock_leave_config }
      get :edit, :id => "37"
      assigns(:leave_config).should be(mock_leave_config)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created leave_config as @leave_config" do
        LeaveConfig.stub(:new).with({'these' => 'params'}) { mock_leave_config(:save => true) }
        post :create, :leave_config => {'these' => 'params'}
        assigns(:leave_config).should be(mock_leave_config)
      end

      it "redirects to the created leave_config" do
        LeaveConfig.stub(:new) { mock_leave_config(:save => true) }
        post :create, :leave_config => {}
        response.should redirect_to(leave_config_url(mock_leave_config))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved leave_config as @leave_config" do
        LeaveConfig.stub(:new).with({'these' => 'params'}) { mock_leave_config(:save => false) }
        post :create, :leave_config => {'these' => 'params'}
        assigns(:leave_config).should be(mock_leave_config)
      end

      it "re-renders the 'new' template" do
        LeaveConfig.stub(:new) { mock_leave_config(:save => false) }
        post :create, :leave_config => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested leave_config" do
        LeaveConfig.should_receive(:find).with("37") { mock_leave_config }
        mock_leave_config.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :leave_config => {'these' => 'params'}
      end

      it "assigns the requested leave_config as @leave_config" do
        LeaveConfig.stub(:find) { mock_leave_config(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:leave_config).should be(mock_leave_config)
      end

      it "redirects to the leave_config" do
        LeaveConfig.stub(:find) { mock_leave_config(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(leave_config_url(mock_leave_config))
      end
    end

    describe "with invalid params" do
      it "assigns the leave_config as @leave_config" do
        LeaveConfig.stub(:find) { mock_leave_config(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:leave_config).should be(mock_leave_config)
      end

      it "re-renders the 'edit' template" do
        LeaveConfig.stub(:find) { mock_leave_config(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested leave_config" do
      LeaveConfig.should_receive(:find).with("37") { mock_leave_config }
      mock_leave_config.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the leave_configs list" do
      LeaveConfig.stub(:find) { mock_leave_config }
      delete :destroy, :id => "1"
      response.should redirect_to(leave_configs_url)
    end
  end

end
