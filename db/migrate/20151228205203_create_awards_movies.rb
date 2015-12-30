class CreateAwardsMovies < ActiveRecord::Migration
  def change
    create_join_table :awards,:movies do |t|
    	t.index :movie_id
    	t.index :award_id
    end
  end
end
