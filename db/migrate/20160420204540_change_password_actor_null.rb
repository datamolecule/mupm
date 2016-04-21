class ChangePasswordActorNull < ActiveRecord::Migration
  def change
    change_column_null(:passwords, :actor_id, false, 0)
  end
end
