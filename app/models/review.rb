class Review < ActiveRecord::Base
	validates :user_id, :product_id, :description, :rating, presence: true
	belongs_to :product
	belongs_to :user
end
