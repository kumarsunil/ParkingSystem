class CreateParkingSlots < ActiveRecord::Migration[5.2]
  def change
    create_table :parking_slots do |t|
      t.integer :sequence_number
      t.boolean :available, default: true
      t.timestamp :auto_release_time

      t.timestamps
    end
  end
end
