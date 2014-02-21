# This migration comes from phoga (originally 20130620031058)
class CreatePhogaArticles < ActiveRecord::Migration
  def change
    create_table :phoga_articles do |t|
      t.string :title
      t.text :body
      t.datetime :published_at
      t.integer :admin_id

      t.timestamps
    end
  end
end
