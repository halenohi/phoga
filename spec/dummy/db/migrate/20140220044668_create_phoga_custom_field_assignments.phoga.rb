# This migration comes from phoga (originally 20130620093407)
class CreatePhogaCustomFieldAssignments < ActiveRecord::Migration
  def change
    create_table :phoga_custom_field_assignments do |t|
      t.string :assignable_type
      t.integer :assignable_id
      t.integer :custom_field_id

      t.timestamps
    end

    add_index :phoga_custom_field_assignments, [:assignable_type, :assignable_id, :custom_field_id], name: :assignable_index
  end
end
