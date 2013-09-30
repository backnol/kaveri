require 'uri'
class Card < ActiveRecord::Base
  ORIGINS = [:local, :twitter, :instagram, :google_plus, :pintrest]
  
  belongs_to :user
  
  validates :title,
            length: { minimum: 1, maximum: 255 }
  validates :origin,
            inclusion: { in: 0..(ORIGINS.size - 1) }
  validates :posted_at,
            presence: true
  validates :link,
            format: { with: URI.regexp }
  validates :image_url,
            format: { with: URI.regexp },
            allow_nil: true,
            allow_blank: true

  def originated_network
    ORIGINS[read_attribute(:origin)]
  end

  def originated_network=(value)
    write_attribute(:origin, ORIGINS.index(value))
  end
end