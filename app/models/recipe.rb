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
	has_many :featured_recipes
	has_many :ratings
	has_many :directions, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :user_favorites, dependent: :destroy, class_name: 'FavoriteRecipe'
	# has_many :user_favorited, through: :favorite_recipes, source: :user

	validates :title, :category, :description, presence: true 
	before_save do 
		self.category = self.category.titleize if self.category
	end
	ratyrate_rateable 'recipe_rating'
	serialize :ratings_hash
	
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
  	
  	def average_ratings
		if ratings_hash.nil?
			return 0
		end
		ones = self.ratings_hash[:one] 
		twos = self.ratings_hash[:two] 
		threes = self.ratings_hash[:three] 
		fours = self.ratings_hash[:four] 
		fives = self.ratings_hash[:five] 
		
		((ones * 1)+(twos * 2)+(threes * 3)+(fours * 4)+(fives * 5))/(ones + twos + threes + fours + fives)

		# (ones+twos+threes+fours+fives)/ 5

		# 1[2]  3[4]   = 2+12/2  1 1 3 3 3 3 = 14/6
		
	end

	def set_rating(stars)
		if self.ratings_hash.nil?
			self.ratings_hash = {one: 0, two: 0, three: 0, four: 0, five: 0}
		end
		
		if stars == 1
			self.ratings_hash[:one] += 1
		end
		
		if stars == 2
			self.ratings_hash[:two] += 1
		end

		if stars == 3
			self.ratings_hash[:three] += 1
		end

		if stars == 4
			self.ratings_hash[:four] += 1
		end

		if stars == 5
			self.ratings_hash[:five] += 1
		end
		
	end
	
end
