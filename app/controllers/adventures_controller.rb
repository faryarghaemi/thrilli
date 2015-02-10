class AdventuresController < ApplicationController

  before_action :logged_in?, :only => [:new]
  helper_method :sort_array_alphabetically 
  
  def index
    @adventures = Adventure.all
  end

  def new
    @options = ['Backpacking', 'Scuba Diving', 'Snowboarding/Skiing', 'Snowmobiling', 'Cycling', 'Mountain Biking', 'Fishing', 'Hiking', 'Kayaking', 'Kite Surfing', 'Dirt Biking', 'Paintballing', 'Camping', 'ATVing', 'Rafting', 'Rappelling', 'Rock Climbing(Indoor)', 'Rock Climbing(Outdoor)', 'Skydiving', 'Slacklining', 'Surfing', 'Snorkling', 'Mountaineering', 'Sailing', 'Motorcycle Racing(on track)', 'Car Racing(on track)', 'Canyoneering', 'Cave Diving', 'Base Jumping', 'Water Skiing', 'Jet Skiing', 'Wakeboarding', 'Outdoor sporting(ball sports)', 'Training'].sort_by{ |word| word.downcase }
    @options.unshift("Other")
    @adventure = Adventure.new 
  end

  def create
    adventure = @current_user.adventures.create(adventure_params)
    redirect_to(adventure)
  end

  def show
    @adventure = Adventure.find params[:id]
  end

  def mine 
    @current_user.adventures
  end 

  def edit
    @adventure = Adventure.find params[:id]
  end

  def update
    adventure = Adventure.find params[:id]
    adventure.update(adventure_params)
    redirect_to(adventure)
  end

  def destroy
    adventure = Adventure.find params[:id] 
    adventure.destroy
    redirect_to(adventures_path)
  end

  def sort_array_alphabetically( array_to_sort )

  end

  private 

  def adventure_params
    params.require(:adventure).permit(:offer_type, :adventure_type, :image, :pickup_location, :activity_location, :availability, :description, :seats, :difficulty, :gender_preference, :sponsor_company, :extras, :age_limit, :duration, :overnight, :title, :creator_id, bookings_attributes: [:adventure_id, :user_id])
  end 
end
