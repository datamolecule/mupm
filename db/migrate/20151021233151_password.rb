class Password < ActiveRecord::Migration
  def change
    create_table :passwords do |t|
      t.text :subject, :default => '', :null => false
      t.text :password, :default => '', :null => false

      t.timestamps :null => false
    end
  end
end
