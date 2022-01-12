class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.belongs_to :registration
      t.decimal :t_amount
      t.date :t_due_date
      t.string :t_status

      t.timestamps
    end
  end
end
