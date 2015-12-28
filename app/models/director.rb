class Director < ActiveRecord::Base
	has_many :movies
	
	validates :name,:bio,presence:true
	validates :name,uniqueness:true
end
