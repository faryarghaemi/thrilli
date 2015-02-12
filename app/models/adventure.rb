# == Schema Information
#
# Table name: adventures
#
#  id                :integer          not null, primary key
#  offer_type        :string
#  adventure_type    :string
#  image             :text
#  pickup_location   :text
#  activity_location :text
#  description       :text
#  seats             :integer
#  difficulty        :string
#  gender_preference :string
#  sponsor_company   :string
#  extras            :text
#  age_limit         :integer
#  duration          :text
#  overnight         :string
#  created_at        :datetime
#  updated_at        :datetime
#  title             :string
#  user_id           :integer
#  checkin           :datetime
#  checkout          :datetime
#  disappear         :boolean          default("false")
#  other             :string
#  profile           :string
#  latitude          :float
#  longitude         :float
#  lat               :float
#  lon               :float
#  city_pickup       :text
#  city_activity     :text
#

class Adventure < ActiveRecord::Base
  def self.search(query)
    where("adventure_type ilike ? OR title ilike ? AND checkin > now()", "%#{query}%", "%#{query}%") 
  end

  mount_uploader :profile, ProfileUploader 
  
  belongs_to :user 
  has_many :bookings 

  # geocoded_by :pickup_location, :latitude => :lat, :longitude => :lon 
  # geocoded_by :activity_location
  after_validation :custom_geocode

  private 
  def custom_geocode 
    start = Geocoder.coordinates(pickup_location + city_pickup)
    stop = Geocoder.coordinates(activity_location + city_activity)

    if start.present? && stop.present? 
      self.latitude = start.first 
      self.longitude = start.last
      self.lat = stop.first 
      self.lon = stop.last
    end 
  end 


end 

















