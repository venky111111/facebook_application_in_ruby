class AddPhoneNumberToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :phonenumber, :string
    add_column :users, :string, :string
  end
end
