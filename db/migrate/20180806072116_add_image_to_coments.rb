class AddImageToComents < ActiveRecord::Migration[5.1]
  def change
    add_column :coments, :image, :text
  end
end
