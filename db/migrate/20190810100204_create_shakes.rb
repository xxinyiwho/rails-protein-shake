class CreateShakes < ActiveRecord::Migration[5.2]
  def change
    create_table :shakes do |t|

      t.timestamps
    end
  end
end
