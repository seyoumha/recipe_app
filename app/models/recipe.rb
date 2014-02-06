# == Schema Information
#
# Table name: recipes
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :string(255)
#  category    :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  avatar      :string(255)
#  photo       :string(255)
#

require 'carrierwave/orm/activerecord'
class Recipe < ActiveRecord::Base
	mount_uploader :photo, PhotoUploader
	has_many :ingredients
	belongs_to :user

	validates :title, :category, :description, presence: true 
	
	def self.search(search)
		if search
			where("title LIKE ?", "%#{search}%")
    else
      find(:all)
    end
  end

end
