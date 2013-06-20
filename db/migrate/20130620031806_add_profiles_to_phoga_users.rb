class AddProfilesToPhogaUsers < ActiveRecord::Migration
  def change
    add_column :phoga_users, :username, :string
    add_column :phoga_users, :description, :text
    add_column :phoga_users, :url, :text
    add_column :phoga_users, :avatar, :string
  end
end
