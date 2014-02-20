# This migration comes from phoga (originally 20130620031806)
class AddProfilesToPhogaAdmins < ActiveRecord::Migration
  def change
    add_column :phoga_admins, :username, :string
    add_column :phoga_admins, :description, :text
    add_column :phoga_admins, :url, :text
    add_column :phoga_admins, :avatar, :string
  end
end
