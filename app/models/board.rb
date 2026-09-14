class Board < ApplicationRecord
  belongs_to :organization
  has_many :lists, dependent: :destroy
  has_many :cards, through: :lists

  validates :name, presence: true
end
