class CreatePhogaCustomFields < ActiveRecord::Migration
  def change
    create_table :phoga_custom_fields do |t|
      t.string :name
      t.text :content
      t.string :image
      t.integer :article_id

      t.timestamps
    end

    add_index :phoga_custom_fields, :name
  end
end
