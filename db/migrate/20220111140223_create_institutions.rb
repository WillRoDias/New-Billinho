# frozen_string_literal: true

# Create the model and validate some columns as the document require to ensure that the data will be add correctly

class CreateInstitutions < ActiveRecord::Migration[6.1]
  def change
    create_table :institutions do |t|
      t.string :name, index: { unique: true }, null: false # Validating in database too
      t.string :cnpj, index: { unique: true }, null: false # Validating in database too
      t.string :i_type

      t.timestamps
    end
  end
end
