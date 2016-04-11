class AddIndexToReadings < ActiveRecord::Migration
  def change
    add_index :readings, :date_measured, unique: false
  end
end
