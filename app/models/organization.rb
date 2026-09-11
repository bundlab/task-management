class Organization < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :organization_members, dependent: :destroy
  has_many :users, through: :organization_members
  has_many :boards, dependent: :destroy

  validates :name, presence: true
end
