class AddIsLegionerToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :is_legioner, :boolean
  end
end
