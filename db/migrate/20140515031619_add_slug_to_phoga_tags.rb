class AddSlugToPhogaTags < ActiveRecord::Migration
  def change
    add_column :phoga_tags, :slug, :string
  end
end
