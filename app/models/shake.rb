class Shake < ApplicationRecord
  has_many :ingredient
  has_many :doses, dependent: :destroy
  validates :name, presence: true
  mount_uploader :photo, PhotoUploader
end
