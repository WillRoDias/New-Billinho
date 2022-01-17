# frozen_string_literal: true

# Create the model and validate some colums as the document require to ensure that the data will be add correctly

class CreateRegistrations < ActiveRecord::Migration[6.1]
  def change
    create_table :registrations do |t|
      t.references :student, null: false, foreign_key: true
      t.references :institution, null: false, foreign_key: true
      t.float :amount, null: false
      t.integer :quantity_ticket, null: false
      t.date :due_date, null: false
      t.string :course, null: false

      t.timestamps
    end
  end
end
