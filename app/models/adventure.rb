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
#  availability      :text
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
#

class Adventure < ActiveRecord::Base 
  belongs_to :user 
  has_many :bookings 
end 
