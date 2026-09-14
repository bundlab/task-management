class CreateLists < ActiveRecord::Migration[7.2]
  def change
    create_table :lists do |t|
      t.string :name
      t.references :board, null: false, foreign_key: true
      t.integer :position

      t.timestamps
    end
  end
end
