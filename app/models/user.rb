class User < ActiveRecord::Base
	has_many :ratings
	
	validates :email,uniqueness:true
end
