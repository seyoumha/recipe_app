# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  first_name             :string(255)      default(""), not null
#  last_name              :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#

class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  after_create :send_welcome_email
  has_many :recipes
  # has_many :favorite_recipes
  # has_many :favorites, through: :favorite_recipes, source: :recipe
  has_many :ratings
  ratyrate_rater
  serialize :rated_recipes
 

  def send_welcome_email
		UserMailer.welcome_email(self).deliver
	end

  def has_favorited?(recipe)
    ro = RecipeOption.where(option_type: 2, recipe_id: recipe.id, user_id: self.id)
    if ro.present?
      return true
    end
  end
  

  def rated recipe
    self.rated_recipes = [] unless rated_recipes
    self.rated_recipes << recipe.id unless self.rated_recipes.include? recipe.id
    self
  end
  
end
