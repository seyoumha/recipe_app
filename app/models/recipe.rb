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
	has_many :comments
	has_many :favorite_recipes
	has_many :user_favorited, through: :favorite_recipes, source: :user

	validates :title, :category, :description, presence: true 
	
	def self.search(search)
		if search
			where("title LIKE ?", "%#{search}%")
    else
      find(:all)
    end
  end

end
