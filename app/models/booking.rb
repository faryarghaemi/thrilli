# == Schema Information
#
# Table name: bookings
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  adventure_id     :integer
#  created_at       :datetime
#  updated_at       :datetime
#  checkin          :datetime
#  checkout         :datetime
#  accepted         :string
#  message          :text
#  message_decision :text
#

class Booking < ActiveRecord::Base
  belongs_to :user 
  belongs_to :adventure 
end 
