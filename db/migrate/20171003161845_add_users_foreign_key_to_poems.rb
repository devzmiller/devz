class AddUsersForeignKeyToPoems < ActiveRecord::Migration
  def change
    add_column :poems, :user_id, :integer, null: false
    add_foreign_key :poems, :users
  end
end
