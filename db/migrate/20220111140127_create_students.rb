class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :name
      t.string :cpf
      t.date :birth
      t.string :tell
      t.string :gender
      t.string :payment

      t.timestamps
    end
  end
end
