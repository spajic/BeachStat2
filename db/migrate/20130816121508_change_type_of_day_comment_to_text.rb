class ChangeTypeOfDayCommentToText < ActiveRecord::Migration
  def change
  	change_column :days, :comment, :text
  end
end
