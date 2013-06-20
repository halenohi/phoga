class CreatePhogaTaggings < ActiveRecord::Migration
  def change
    create_table :phoga_taggings do |t|
      t.string :taggable_type
      t.integer :taggable_id
      t.integer :tag_id

      t.timestamps
    end

    add_index :phoga_taggings, [:taggable_type, :taggable_id, :tag_id], name: 'taggable_index'
  end
end
