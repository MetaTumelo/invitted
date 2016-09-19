class Rsvp < ApplicationRecord

  	belongs_to :event
  	validates_length_of :message, :maximum => 140
  	validates :name, presence: true
  	
end
