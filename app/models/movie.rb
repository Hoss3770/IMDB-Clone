class Movie < ActiveRecord::Base

  	belongs_to :director
  	belongs_to :genre
  	has_and_belongs_to_many :actors
  	has_and_belongs_to_many :awards
  	has_many :ratings

  	validates :name,:description,:trailer,presence:true
  	validates :name,:trailer,uniqueness:true
  	

  	accepts_nested_attributes_for :actors,allow_destroy:true;


end
