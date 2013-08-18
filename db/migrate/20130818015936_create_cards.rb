class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :title
      t.integer :origin, default: 0
      t.datetime :posted_at
      t.integer :user_id

      t.timestamps
    end
  end
end
