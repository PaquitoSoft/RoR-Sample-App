class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @title = @user.name
  end
  
  def new
    @user = User.new
    @title = "Sign up"
  end

  def create 
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      # redirect_to @user # This code is not understood by RSpec
      redirect_to user_path(@user) # Also -> redirect_to @user
    else
      @title = "Sign up"
      @user.password = nil
      @user.password_confirmation = nil
      render 'new'
    end
  end
  
end
