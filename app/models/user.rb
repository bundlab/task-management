class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :organization_members, dependent: :destroy
  has_many :organizations, through: :organization_members

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
end
