class UsersController < ApplicationController
  before_action :deleted? 
  before_action :check_if_admin, :only => [:index] 
  require 'mandrill'
  before_action :logged_in?, :only => [:show]

  def index
    @users = User.all 
  end 

  def show 
    @user = User.find params[:id]
  end 

  def new
    @user = User.new 
  end 

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id

      m = Mandrill::API.new
      message = {  
      :subject=> "Thrilli",  
      :from_name=> "Thrilli",  
      :text=>"Hi #{@user.first_name}, 
        Thanks for signing up with Thrilli!",  
      :to=>[  
      {  
      :email=> @user.email,  
      :name=> @user.first_name  
      }  
      ],    
      :from_email=>"adventure@funtimes.com"  
      }  
      sending = m.messages.send message  
      redirect_to(root_path)
    else 
      render :new
    end 
  end

  def edit
    @user = User.find params[:id] 
  end 

  def update 
    user = User.find params[:id]
    user.update(user_params)
    redirect_to(user)
  end 

  def destroy
    user = User.find params[:id]
    user.destroy
    redirect_to(users_path)
  end 
  
  private 

  def check_if_admin 
    redirect_to(root_path) unless @current_user.present? && @current_user.is_admin 
  end 

  def user_params 
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :dob, :phone, :gender, :description, :smoker, :interests, :car, :car_type, :car_year, :car_model, :image, :occupation, :profile, :remote_profile_url)
  end
end 














