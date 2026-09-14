class CreateCards < ActiveRecord::Migration[7.2]
  def change
    create_table :cards do |t|
      t.string :title, null: false
      t.text :description
      t.integer :position
      t.references :list, null: false, foreign_key: true
      t.references :assignee, foreign_key: { to_table: :users }
      t.datetime :due_date
      t.datetime :completed_at
      t.timestamps
    end
  end
end
