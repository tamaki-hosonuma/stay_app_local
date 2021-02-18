class ChangeToUsersColumns < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :password, :string
    remove_column :users, :password_digest, :string
  end
end
