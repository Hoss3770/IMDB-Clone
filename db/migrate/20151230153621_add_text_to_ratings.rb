class AddTextToRatings < ActiveRecord::Migration
  def change
    add_column :ratings, :text, :text
  end
end
