class Photo < ActiveRecord::Base
  belongs_to :photographer
  validates :photographer_id, presence: true
  validates :name, presence: true, length: { minimum: 5, maximum: 100 }
  validates :caption, presence: true, length: { minimum: 10, maximum: 150}
end

