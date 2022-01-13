class CreateInstitutions < ActiveRecord::Migration[6.1]
  def change
    create_table :institutions do |t|
      t.string :name, index: { unique: true}, null: false
      t.string :cnpj, index: { unique: true}, null: false
      t.string :i_type

      t.timestamps
    end
  end
end
