class CreateActors < ActiveRecord::Migration
  def change
    create_table :actors do |t|
      t.string :name
      t.text :bio

      t.timestamps null: false
    end
    create_join_table :movies,:actors do |t|
    	t.index :movie_id
    	t.index :actor_id
    end
  end
end
