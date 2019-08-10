class CreateQuantities < ActiveRecord::Migration[5.2]
  def change
    create_table :quantities do |t|
      t.references :ingredient, foreign_key: true
      t.references :shake, foreign_key: true

      t.timestamps
    end
  end
end
