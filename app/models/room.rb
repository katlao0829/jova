class Room < ApplicationRecord
  has_many :directmessages, dependent: :destroy
  has_many :entries
end
