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
	resourcify
	mount_uploader :photo, PhotoUploader

	has_many :ingredients, dependent: :destroy
	accepts_nested_attributes_for :ingredients,
	:reject_if => :all_blank

	belongs_to :user
	has_many :directions, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :favorite_recipes, dependent: :destroy
	has_many :user_favorited, through: :favorite_recipes, source: :user

	validates :title, :category, :description, presence: true 
	before_save do 
		self.category = self.category.titleize if self.category
	end
	
	def self.search(search)
		if search
			where("title LIKE ? or category LIKE ?", "%#{search}%", "%#{search}%")
    	else
      		find(:all)
    	end
  	end

  	def tags
  		category.gsub(' ', '').split(",") if category
  	end
  	def created_by(user)
  		self.user == user   
  	end

end
