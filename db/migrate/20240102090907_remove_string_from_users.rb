class RemoveStringFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :string, :string
   

  end
end
