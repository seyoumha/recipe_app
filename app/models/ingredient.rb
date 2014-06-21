# == Schema Information
#
# Table name: ingredients
#
#  id         :integer          not null, primary key
#  item       :string(255)
#  amount     :float
#  unit       :string(255)
#  direction  :string(255)
#  created_at :datetime
#  updated_at :datetime
#  recipe_id  :integer
#

class Ingredient < ActiveRecord::Base
	belongs_to :recipe

	validates :item, :amount, :unit, presence: true

end
