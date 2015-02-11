class AdventuresController < ApplicationController
  require 'mandrill'

  before_action :deleted? 
  before_action :logged_in?, :only => [:new, :show]
  helper_method :sort_array_alphabetically 
  
  def index
      if params[:search]
        @adventures = Adventure.search(params[:search]).order("created_at DESC")
      else
        @adventures = Adventure.all.order('created_at DESC')
      end
  end

  def new
    @options = ['Backpacking', 'Scuba Diving', 'Snowboarding/Skiing', 'Snowmobiling', 'Cycling', 'Mountain Biking', 'Fishing', 'Hiking', 'Kayaking', 'Kite Surfing', 'Dirt Biking', 'Paintballing', 'Camping', 'ATVing', 'Rafting', 'Rappelling', 'Rock Climbing(Indoor)', 'Rock Climbing(Outdoor)', 'Skydiving', 'Slacklining', 'Surfing', 'Snorkling', 'Mountaineering', 'Sailing', 'Motorcycle Racing(on track)', 'Car Racing(on track)', 'Canyoneering', 'Cave Diving', 'Base Jumping', 'Water Skiing', 'Jet Skiing', 'Wakeboarding', 'Outdoor sporting(ball sports)', 'Training'].sort_by{ |word| word.downcase }
    @options.unshift("Other")
    @adventure = Adventure.new 
  end

  def create
    adventure = @current_user.adventures.create(adventure_params)

        
      m = Mandrill::API.new
      message = {  
      :subject=> "Thrilli",  
      :from_name=> "Thrilli",  
      :text=>"Hi <strong>#{@current_user.first_name}</strong>, thanks for creating an adventure!",  
      :to=>[  
      {  
      :email=> @current_user.email,  
      :name=> @current_user.first_name  
      }  
      ],    
      :from_email=>"adventure@funtimes.com"  
      }  
      sending = m.messages.send message  

    redirect_to(adventure)
  end

  def show
    @adventure = Adventure.find params[:id]
  end

  def maps 
     @adventure = Adventure.find params[:id]
    render :json => @adventure
  end 

  def mine 
    @current_user.adventures
  end 

  def edit
    @options = ['Backpacking', 'Scuba Diving', 'Snowboarding/Skiing', 'Snowmobiling', 'Cycling', 'Mountain Biking', 'Fishing', 'Hiking', 'Kayaking', 'Kite Surfing', 'Dirt Biking', 'Paintballing', 'Camping', 'ATVing', 'Rafting', 'Rappelling', 'Rock Climbing(Indoor)', 'Rock Climbing(Outdoor)', 'Skydiving', 'Slacklining', 'Surfing', 'Snorkling', 'Mountaineering', 'Sailing', 'Motorcycle Racing(on track)', 'Car Racing(on track)', 'Canyoneering', 'Cave Diving', 'Base Jumping', 'Water Skiing', 'Jet Skiing', 'Wakeboarding', 'Outdoor sporting(ball sports)', 'Training'].sort_by{ |word| word.downcase }
    @options.unshift("Other")
    @adventure = Adventure.find params[:id]
  end

  def update
    adventure = Adventure.find params[:id]
    adventure.update(adventure_params)
    redirect_to(adventure)
  end

  def disappear
    adventure = Adventure.find params[:id] 
    adventure.disappear = true
    adventure.save 
    redirect_to(adventures_path)
  end

  def sort_array_alphabetically( array_to_sort )

  end

  private 

  def adventure_params
    params.require(:adventure).permit(:offer_type, :adventure_type, :image, :pickup_location, :activity_location, :availability, :description, :seats, :difficulty, :gender_preference, :sponsor_company, :extras, :profile, :age_limit, :duration, :latitude, :longitude, :lat, :lon, :overnight, :title, :creator_id, bookings_attributes: [:adventure_id, :user_id])
  end 
end
