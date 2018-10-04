class ChangeDatatypeContentOfShops < ActiveRecord::Migration[5.0]
  def change
    change_column :shops, :content, :text
  end
end