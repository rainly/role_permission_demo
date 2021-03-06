require 'spec_helper'

describe AdminsController do

  def mock_admin(stubs={})
    @mock_admin ||= mock_model(Admin, stubs)
  end

  describe "GET index" do
    it "assigns all admins as @admins" do
      Admin.stub(:find).with(:all).and_return([mock_admin])
      get :index
      assigns[:admins].should == [mock_admin]
    end
  end

  describe "GET show" do
    it "assigns the requested admin as @admin" do
      Admin.stub(:find).with("37").and_return(mock_admin)
      get :show, :id => "37"
      assigns[:admin].should equal(mock_admin)
    end
  end

  describe "GET new" do
    it "assigns a new admin as @admin" do
      Admin.stub(:new).and_return(mock_admin)
      get :new
      assigns[:admin].should equal(mock_admin)
    end
  end

  describe "GET edit" do
    it "assigns the requested admin as @admin" do
      Admin.stub(:find).with("37").and_return(mock_admin)
      get :edit, :id => "37"
      assigns[:admin].should equal(mock_admin)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created admin as @admin" do
        Admin.stub(:new).with({'these' => 'params'}).and_return(mock_admin(:save => true))
        post :create, :admin => {:these => 'params'}
        assigns[:admin].should equal(mock_admin)
      end

      it "redirects to the created admin" do
        Admin.stub(:new).and_return(mock_admin(:save => true))
        post :create, :admin => {}
        response.should redirect_to(admin_url(mock_admin))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved admin as @admin" do
        Admin.stub(:new).with({'these' => 'params'}).and_return(mock_admin(:save => false))
        post :create, :admin => {:these => 'params'}
        assigns[:admin].should equal(mock_admin)
      end

      it "re-renders the 'new' template" do
        Admin.stub(:new).and_return(mock_admin(:save => false))
        post :create, :admin => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested admin" do
        Admin.should_receive(:find).with("37").and_return(mock_admin)
        mock_admin.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :admin => {:these => 'params'}
      end

      it "assigns the requested admin as @admin" do
        Admin.stub(:find).and_return(mock_admin(:update_attributes => true))
        put :update, :id => "1"
        assigns[:admin].should equal(mock_admin)
      end

      it "redirects to the admin" do
        Admin.stub(:find).and_return(mock_admin(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(admin_url(mock_admin))
      end
    end

    describe "with invalid params" do
      it "updates the requested admin" do
        Admin.should_receive(:find).with("37").and_return(mock_admin)
        mock_admin.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :admin => {:these => 'params'}
      end

      it "assigns the admin as @admin" do
        Admin.stub(:find).and_return(mock_admin(:update_attributes => false))
        put :update, :id => "1"
        assigns[:admin].should equal(mock_admin)
      end

      it "re-renders the 'edit' template" do
        Admin.stub(:find).and_return(mock_admin(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested admin" do
      Admin.should_receive(:find).with("37").and_return(mock_admin)
      mock_admin.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the admins list" do
      Admin.stub(:find).and_return(mock_admin(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(admins_url)
    end
  end

end
