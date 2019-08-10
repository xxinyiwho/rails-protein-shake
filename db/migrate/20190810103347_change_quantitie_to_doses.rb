class ChangeQuantitieToDoses < ActiveRecord::Migration[5.2]
  def change
    rename_table :quantities, :doses
  end
end
