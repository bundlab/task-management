class OrganizationMember < ApplicationRecord
  belongs_to :user
  belongs_to :organization

  enum role: { member: 0, admin: 1, owner: 2 }

  validates :role, presence: true
end
