class BookingsController < ApplicationController

  def new 
    @adventure = Adventure.find params[:adventure_id]
    @booking = @adventure.bookings.new 
  end 

  def create 
    @adventure = Adventure.find params[:adventure_id]

    @booking = @adventure.bookings.create(booking_params)

    redirect_to(adventure_booking_path(@adventure, @booking))
  end 

  def edit 
    @adventure = Adventure.find params[:adventure_id]
    @booking = @adventure.bookings.find params[:id]
  end 

  def update 
    @adventure = Adventure.find params[:adventure_id]
    @booking = @adventure.bookings.find params[:id]
    @booking.update
  end 

  def index 
    @adventure = Adventure.find params[:adventure_id]
    @bookings = @adventure.bookings 
  end 

  def show
    @adventure = Adventure.find params[:adventure_id]
    @booking = @adventure.bookings.find params[:id]
  end 

  def destroy 
    @adventure = Adventure.find params[:adventure_id]
    @booking = @adventure.bookings.find params[:id]
    @booking.destroy 
  end 

  private 

  def booking_params 
    params.require(:booking).permit(:user_id, :adventure_id, :availability)
  end

end 

