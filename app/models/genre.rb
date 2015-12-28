class Genre < ActiveRecord::Base
	has_many :movies
	
	validates :name,:description,presence:true
	validates :name,uniqueness:true
end
