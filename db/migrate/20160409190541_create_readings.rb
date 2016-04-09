class CreateReadings < ActiveRecord::Migration
  def change
    create_table :readings do |t|
      t.belongs_to :user, index: true
      t.integer :glucose_level
      t.date :date_measured
      t.timestamps null: false
    end
  end
end
