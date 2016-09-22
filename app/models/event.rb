class Event < ApplicationRecord
     extend FriendlyId
    friendly_id :eventname, use: [:slugged, :history, :finders]
    belongs_to :user
    has_many :rsvps, dependent: :destroy

  	def should_generate_new_friendly_id?
  		slug.blank? || eventname_changed?
  	end

  	has_attached_file :image, styles: { medium: "250x250>", thumb: "100x150>" }, 
    :storage => :cloudinary, 
    :path => "/:class/:attachment/:id_partition/:style/:filename"
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

	validates :eventname, presence: true

end
  