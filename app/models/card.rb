require 'uri'
class Card < ActiveRecord::Base
  ORIGINS = [:local, :twitter]
  
  belongs_to :user
  
  validates :title,
            length: { minimum: 1, maximum: 255 }
  validates :origin,
            inclusion: { in: 0..ORIGINS.size-1 }
  validates :posted_at,
            presence: true
  validates :link,
            format: { with: URI.regexp }
end