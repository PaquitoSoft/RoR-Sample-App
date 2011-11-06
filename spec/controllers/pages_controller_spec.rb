require 'spec_helper'

describe PagesController do
	render_views

  before(:each) do
    @base_title = "Ruby on Rails Tutorial Sample App"
  end

  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end
=begin
		it "should have the right title" do
			response.should have_selector("title", :content => @base_title + " | Home")
		end
=end
  end

  describe "GET 'contact'" do
    it "should be successful" do
      get 'contact'
      response.should be_success
    end
=begin
		it "should have the right title" do
			response.should have_selector("title", :content => @base_title + " | Contact")
		end
=end
  end

	describe "GET 'about'" do
		it "should be successful" do
			get 'about'
			response.should be_success
		end
=begin
		it "should have the right title" do
			response.should have_selector("title", :content => @base_title + " | About")
		end
=end
	end

        describe "GET 'help'" do
            it "should be successful" do
		get 'help'
		response.should be_success
            end
=begin
	    it "should have the right title" do
	    	response.should have_selector("title", :content => @base_title + " | Help")
	    end
=end
        end

end
