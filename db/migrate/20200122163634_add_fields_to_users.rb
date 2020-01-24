class AddFieldsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :password_digest, :string
    add_column :users, :profile_image, :string
    add_column :users, :biography, :string
  end
end
