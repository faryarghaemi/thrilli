# == Schema Information
#
# Table name: bookings
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  adventure_id :integer
#  created_at   :datetime
#  updated_at   :datetime
#  checkin      :datetime
#  checkout     :datetime
#  accepted     :string
#  message      :text
#  latitude     :float
#  longitude    :float
#

class Booking < ActiveRecord::Base 
  belongs_to :user 
  belongs_to :adventure 

  # geocoded_by :pickup_location, :activity_location 
  # after_validation :geocode
end 
