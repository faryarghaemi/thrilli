class BookingsController < ApplicationController
  include ActionView::Helpers::TextHelper
  before_action :deleted? 
  require 'mandrill'
  
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

    m = Mandrill::API.new
      message = {  
      :subject=> "Thrilli-Requested Booking",  
      :from_name=> "Thrilli",  
      :text=>"Hi #{@adventure.user.first_name},
      #{@current_user.first_name} has requested to book your #{@adventure.title} adventure. Please login to either accept or reject the request.
      Best, 
      Thrilli",  
      :to=>[  
      {  
      :email=> @adventure.user.email,  
      :name=> @adventure.user.first_name  
      }  
      ],    
      :from_email=>"adventure@funtimes.com"  
      }  
      sending = m.messages.send message

      m = Mandrill::API.new
      message = {  
      :subject=> "Thrilli-Requested Booking",  
      :from_name=> "Thrilli",  
      :text=>"Hi #{@current_user.first_name}, 
      Thanks for requesting to book #{@adventure.user.first_name}'s #{@adventure.title} adventure! We will let them know straight away and email you once they have reviewed your request! Have a good day.
      Best, 
      Thrilli",  
      :to=>[  
      {  
      :email=> @current_user.email,  
      :name=> @current_user.first_name  
      }  
      ],    
      :from_email=>"adventure@funtimes.com"  
      }  
      sending = m.messages.send message

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

      m = Mandrill::API.new
      message = {  
      :subject=> "Thrilli-You're going on an adventure!",  
      :from_name=> "Thrilli",  
      :text=>"Hi #{@booking.user.first_name},
      #{@current_user.first_name} has accepted your request for their #{@adventure.title} adventure. Have a great time!
    Best, 
    Thrilli",  
      :to=>[  
      {  
      :email=> @booking.user.email,  
      :name=> @booking.user.first_name  
      }  
      ],    
      :from_email=>"adventure@funtimes.com"  
      }  
      sending = m.messages.send message
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

     m = Mandrill::API.new
      message = {  
      :subject=> "Thrilli-meep!",  
      :from_name=> "Thrilli",  
      :text=>"Hi #{@booking.user.first_name},

      #{@current_user.first_name} has unfortunately declined your request to join them on their #{@adventure.title} adventure. They may have already filled their seats or cancelled their plans. Login to Thrilli to find out. Hope to see you on another adventure soon! 

    Best, 
    Thrilli",  
      :to=>[  
      {  
      :email=> @booking.user.email,  
      :name=> @booking.user.first_name  
      }  
      ],    
      :from_email=>"adventure@funtimes.com"  
      }  
      sending = m.messages.send message
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
    @booking.update :message_decision => params[:booking][:message_decision]
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
    params.require(:booking).permit(:user_id, :adventure_id,:latitude, :longitude, :lat, :lon, :message, :message_decision, :availability, :checkin, :checkout, :profile, :remote_profile_url)
  end

end 

