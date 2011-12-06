require 'spec_helper'

describe "Users" do
  
  describe "signup" do
    
    describe "failure" do
      
      it "should not make a new user" do
        lambda do
          visit signup_path
          fill_in "Name", :with => ""
          fill_in "Email", :with => ""
          fill_in "Password", :with => ""
          fill_in "Confirmation", :with => ""
          click_button
          response.should render_template('users/new')
          response.should have_selector("div#error_explanation")
        end.should_not change(User, :count)
      end
      
      it "should make a new user" do
        lambda do
          visit signup_path
          fill_in "Name", :with => "Example User"
          fill_in "Email", :with => "user@emaple.com"
          fill_in "Password", :with => "foobar"
          fill_in "Confirmation", :with => "foobar"
          click_button
          response.should render_template('users/show')
          response.should have_selector("div.flash.success", :content => "Welcome")
        end.should change(User, :count).by(1)
      end
      
    end
    
  end

  describe "sign in/out" do
    
    describe "failure" do
      
      it "should not sign a user in" do
        integration_sign_in("", "")
        response.should have_selector("div.flash.error", :content => "Invalid")
      end
      
    end
    
    describe "success" do
      
      it "sould sign a user in and out" do
        user = Factory(:user)
        integration_sign_in(user.email, user.password)
        controller.should be_signed_in
        click_link "Sign out"
        controller.should_not be_signed_in
      end
      
    end
    
  end
  
  describe "admin attribute" do
    
    before(:each) do
      @user = User.create!(@attr)
    end
    
    it "should responde to admin" do
      @user.should respond_to(:admin)
    end
    
    it "should not be an admin by default" do
      @user.should_not be_admin
    end
    
    it "should be convertible to an admin" do
      @user.toogle!(:admin)
      @user.should be_admin
    end
    
  end
  
end
