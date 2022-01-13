class CreateRegistrations < ActiveRecord::Migration[6.1]
  def change
    create_table :registrations do |t|
      t.references :student, null: false, foreign_key: true
      t.references :institution, null: false, foreign_key: true
      t.float :amount, null: false, precision: 2
      t.integer :quantity_ticket, null: false
      t.integer :due_date, null: false
      t.string :course, null: false

      t.timestamps
    end
  end
end
