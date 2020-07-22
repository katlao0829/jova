class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :group_users
  has_many :groups, through: :group_users
  has_many :messages
  has_many :directmessages, dependent: :destroy
  has_many :entries, dependent: :destroy
  

  validates :name, presence: true
  validates :country, presence: true
  validates :job, presence: true
  validates :term, presence: true
  
  mount_uploader :image, ImageUploader

end
