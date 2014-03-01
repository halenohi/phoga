class CreatePhogaArticles < ActiveRecord::Migration
  def change
    create_table :phoga_articles do |t|
      t.string :title
      t.text :content
      t.datetime :published_at
      t.integer :admin_id

      t.timestamps
    end
  end
end
