class CreatePhogaTags < ActiveRecord::Migration
  def change
    create_table :phoga_tags do |t|
      t.string :name

      t.timestamps
    end

    add_index :phoga_tags, :name, unique: true
  end
end
