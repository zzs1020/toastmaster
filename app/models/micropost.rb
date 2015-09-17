class Micropost < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy

  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader

  validates :user_id, presence: true
  validates :content, length: {maximum: 140}
  validate :picture_size

  private
    def picture_size
      if picture.size > 8.megabytes
        errors.add(:picture, 'picture should be less than 8MB')
      end
    end
end
