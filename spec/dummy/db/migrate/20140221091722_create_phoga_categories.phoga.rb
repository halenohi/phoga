# This migration comes from phoga (originally 20130620084958)
class CreatePhogaCategories < ActiveRecord::Migration
  def change
    create_table :phoga_categories do |t|
      t.string :name
      t.string :slug
      t.integer :parent_id
      t.integer :position

      t.timestamps
    end

    add_index :phoga_categories, :name
    add_index :phoga_categories, :slug
    add_index :phoga_categories, :parent_id
  end
end
