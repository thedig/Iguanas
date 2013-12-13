class AddUserIdToIguana < ActiveRecord::Migration
  def change
    add_column :iguanas, :user_id, :integer, :null => false
    add_index :iguanas, :user_id
  end
end
