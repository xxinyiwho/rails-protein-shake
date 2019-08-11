class AddQuantityToDose < ActiveRecord::Migration[5.2]
  def change
    add_column :doses, :quantity, :string
  end
end
