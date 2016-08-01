class Moment < ActiveRecord::Base
  validates :image, presence: true
  has_attached_file :image, styles: { :medium => "640x" }
  validates_attachment_content_type :image, :content_type =>
      /\Aimage\/.*\Z/
  belongs_to :user
  validates :user_id, presence: true
  has_many :comments, dependent: :destroy
  validates :caption, length: { minimum: 3, maximum: 300 }
  acts_as_votable
end