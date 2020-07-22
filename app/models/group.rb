class Group < ApplicationRecord
  has_many :group_users
  has_many :users, through: :group_users
  has_many :messages
  
  validates :name, presence: true

  mount_uploader :image, ImageUploader

  def self.search(search)
    return Group.all unless search
    Group.where('name LIKE(?)', "%#{search}%")
  end

end
