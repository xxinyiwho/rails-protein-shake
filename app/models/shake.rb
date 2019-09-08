class Shake < ApplicationRecord
  has_many :ingredient
  has_many :doses, dependent: :destroy
  validates :name, presence: true
  belongs_to :user
  mount_uploader :photo, PhotoUploader
end
