class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :content, null: false
      t.integer :user_id
      t.boolean :finished, null: false, default: false
      t.integer :priority      
      t.timestamps
    end
  end
end
