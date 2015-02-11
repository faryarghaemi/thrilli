class BookingsController < ApplicationController
  include ActionView::Helpers::TextHelper
  before_action :deleted? 
 
  
  def new 
    @adventure = Adventure.find params[:adventure_id]
    @booking = @adventure.bookings.new 
  end 

  def create 
    @adventure = Adventure.find params[:adventure_id]
    @booking = Booking.new(booking_params)
    @booking.user = @current_user
    @booking.adventure = @adventure 
    @booking.save 

    redirect_to(adventure_booking_path(@adventure, @booking))
  end 

  # def edit 
  #   @adventure = Adventure.find params[:adventure_id]
  #   @booking = @adventure.bookings.find params[:id]
  # end 

  def yes 
    @adventure = Adventure.find params[:adventure_id]
    @booking = @adventure.bookings.find params[:booking_id]

    @booking.accepted = 'yes'

    number = @adventure.bookings.where :accepted => 'yes'
    if number.count < @adventure.seats
      @booking.save
    else
      flash[:error] = "You have already filled up your #{ pluralize(@adventure.seats, 'seat') }."
      redirect_to(no_path(:adventure_id => @adventure.id, :booking_id => @booking.id))
      # redirect_to(adventures_mine_path(@current_user))
    end
  end 

  def no 
    @adventure = Adventure.find params[:adventure_id]
    @booking = Booking.find params[:booking_id]
    @booking.accepted = 'no'
    @booking.save
    # redirect_to(adventures_mine_path(@current_user))
  end 


  def index 
    @adventure = Adventure.find params[:adventure_id]
    @bookings = @adventure.bookings.where :accepted => nil
  end 

  def show
    @adventure = Adventure.find params[:adventure_id]
    @booking = @adventure.bookings.find params[:id]

    # m = Mandrill::API.new
    #   message = {  
    #   :subject=> "Thrilli-Requested Booking",  
    #   :from_name=> "Thrilli",  
    #   :text=>"Hi <strong>#{@current_user.first_name}</strong>, thanks for requesting a booking!",  
    #   :to=>[  
    #   {  
    #   :email=> @current_user.email,  
    #   :name=> @current_user.first_name  
    #   }  
    #   ],   
    #   :from_email=>"adventure@funtimes.com"  
    #   }  
    #   sending = m.messages.send message 
  end 

  # def destroy 
  #   @adventure = Adventure.find params[:adventure_id]
  #   @booking = @adventure.bookings.find params[:id]
  #   @booking.destroy 
  # end 

  def update 
    @adventure = Adventure.find params[:adventure_id]
    @booking = @adventure.bookings.find params[:id]
    @booking.update :message => params[:booking][:message]
    redirect_to(adventures_mine_path(@current_user))
  end 

  def user 
    @adventure = Adventure.find params[:adventure_id]
    @booking = @adventure.bookings.find params[:booking_id]
  end 

  def bookings 
    @bookings = @current_user.bookings
  end 

  # def pending 
  #   @bookings = @current_user.bookings.where :accepted => nil 
  # end 

  # def confirmed
  #   @bookings = @current_user.bookings.where(:accepted => 'yes')
  # end 

  # def cancellations 
  #   @bookings = @current_user.bookings.where(:accepted => 'no')
  # end 


  private 

  def booking_params 
    params.require(:booking).permit(:user_id, :adventure_id,:latitude, :longitude, :lat, :lon, :availability, :checkin, :checkout, :profile, :remote_profile_url)
  end

end 

