class CreatePhogaCategorizations < ActiveRecord::Migration
  def change
    create_table :phoga_categorizations do |t|
      t.string :categorizable_type
      t.integer :categorizable_id
      t.integer :category_id

      t.timestamps
    end

    add_index :phoga_categorizations, [:categorizable_type, :categorizable_id, :category_id], name: 'categorizable_index'
  end
end
