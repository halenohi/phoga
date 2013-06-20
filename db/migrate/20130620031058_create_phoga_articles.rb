class CreatePhogaArticles < ActiveRecord::Migration
  def change
    create_table :phoga_articles do |t|
      t.string :title
      t.text :body
      t.datetime :published_at
      t.integer :user_id

      t.timestamps
    end
  end
end
