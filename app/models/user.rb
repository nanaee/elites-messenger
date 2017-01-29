class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  has_many :user
  has_many :like
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  mount_uploader :thumbnail, UserThumbnailUploader
  
  validates :name, presence: true
  validates :agreement, presence: true, acceptance: {accept: true}
end
