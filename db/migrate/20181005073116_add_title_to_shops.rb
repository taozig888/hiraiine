class AddTitleToShops < ActiveRecord::Migration[5.0]
  def change
    add_column :shops, :title, :string
  end
end
