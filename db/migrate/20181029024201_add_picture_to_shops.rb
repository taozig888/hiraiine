class AddPictureToShops < ActiveRecord::Migration[5.0]
  def change
    add_column :shops, :picture, :string
  end
end
