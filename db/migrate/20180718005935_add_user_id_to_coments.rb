class AddUserIdToComents < ActiveRecord::Migration[5.1]
  def change
    add_column :coments,:user_id,:integer
  end
end
