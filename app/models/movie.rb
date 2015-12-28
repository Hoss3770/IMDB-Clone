class Movie < ActiveRecord::Base

  	belongs_to :director
  	belongs_to :genre
  	has_and_belongs_to_many :actors
  	has_and_belongs_to_many :awards
  	has_many :ratings

  	validates :name,:description,:trailer,:actors,presence:true
  	validates :name,:trailer,uniqueness:true


end
