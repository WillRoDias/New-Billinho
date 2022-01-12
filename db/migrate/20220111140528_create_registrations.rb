class CreateRegistrations < ActiveRecord::Migration[6.1]
  def change
    create_table :registrations do |t|
      t.references :student, null: false, foreign_key: true
      t.references :institution, null: false, foreign_key: true
      t.float :amount
      t.integer :quantity_ticket
      t.integer :due_date
      t.string :course

      t.timestamps
    end
  end
end
