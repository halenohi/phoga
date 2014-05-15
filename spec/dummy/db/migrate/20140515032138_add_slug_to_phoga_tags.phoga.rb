# This migration comes from phoga (originally 20140515031619)
class AddSlugToPhogaTags < ActiveRecord::Migration
  def change
    add_column :phoga_tags, :slug, :string
  end
end
