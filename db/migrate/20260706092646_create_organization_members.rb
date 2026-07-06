class CreateOrganizationMembers < ActiveRecord::Migration[7.2]
  def change
    create_table :organization_members do |t|
      t.references :user, null: false, foreign_key: true
      t.references :organization, null: false, foreign_key: true
      t.string :role

      t.timestamps
    end
  end
end
