# frozen_string_literal: true

# Create the model and validate some colums as the document require to ensure that the data will be add correctly

class CreateBills < ActiveRecord::Migration[6.1]
  def change
    create_table :bills do |t|
      # t.belongs_to :enrollment
      t.references :enrollment, null: false, foreign_key: true
      t.decimal :t_amount, null: false
      t.date :t_due_date, null: false
      t.string :t_status, null: false

      t.timestamps
    end
  end
end
