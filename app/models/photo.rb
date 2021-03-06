class Photo < ActiveRecord::Base
  belongs_to :photographer
  validates :photographer_id, presence: true
  validates :name, presence: true, length: { minimum: 5, maximum: 100 }
  validates :caption, presence: true, length: { minimum: 10, maximum: 150}
  mount_uploader :picture, PictureUploader
  validate :picture_size
  
  private
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
      
end

