class Shake < ApplicationRecord
  has_many :ingredient
  has_many :quantity
end
