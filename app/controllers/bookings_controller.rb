class BookingsController < ApplicationController

  def create 
    @current_adventure = Adventure.find_by :id => session[:adventure_id]
    booking_user = @current_user.bookings.create(booking_params)
    booking_adventure = @current_adventure.bookings.create(booking_params)
    redirect_to root_path
  end 

  def index 
    @bookings = Booking.all 
  end 

  def show
    @current_user.bookings
    @current_adventure.bookings
  end 

  private 

  def booking_params 
    params.require(:booking).permit(:user_id, :adventure_id)
  end

end 

