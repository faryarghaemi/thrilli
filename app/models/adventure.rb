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
#

class Adventure < ActiveRecord::Base
  mount_uploader :profile, ProfileUploader 
  
  belongs_to :user 
  has_many :bookings 
end 
