class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :day_id
      t.integer :num_in_day
      t.integer :win_points
      t.integer :lose_points

      t.timestamps
    end
  end
end
