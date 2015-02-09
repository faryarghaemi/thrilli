# == Schema Information
#
# Table name: bookings
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  adventure_id :integer
#  created_at   :datetime
#  updated_at   :datetime
#  availability :datetime
#

class Booking < ActiveRecord::Base 
  belongs_to :user 
  belongs_to :adventure 
end 
