class AddPhotoToShakes < ActiveRecord::Migration[5.2]
  def change
    add_column :shakes, :photo, :string
  end
end
