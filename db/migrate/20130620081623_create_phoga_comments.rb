class CreatePhogaComments < ActiveRecord::Migration
  def change
    create_table :phoga_comments do |t|
      t.string :commentable_type
      t.integer :commentable_id
      t.string :author_name
      t.string :author_email
      t.text :body
      t.datetime :published_at
      t.integer :reply_to_id

      t.timestamps
    end

    add_index :phoga_comments, [:commentable_type, :commentable_id], name: :commentable_index
  end
end
