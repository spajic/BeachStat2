class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :game_id
      t.integer :player_id
      t.boolean :win

      t.timestamps
    end
  end
end
