class Dose < ApplicationRecord
  belongs_to :ingredient
  belongs_to :shake
   validates :quantity, presence: true
  validates :ingredient, uniqueness: { scope: :shake }
end
