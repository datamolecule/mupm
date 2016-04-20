class AddActorToPassword < ActiveRecord::Migration
  def change
    add_column :passwords, :actor_id, :integer
    add_index :passwords, :actor_id
  end
end
