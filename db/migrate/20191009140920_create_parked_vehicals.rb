class CreateParkedVehicals < ActiveRecord::Migration[5.2]
  def change
    create_table :parked_vehicals do |t|
      t.integer :parking_slot_id
      t.text :vehical_no_plate
      t.timestamp :parking_start_time
      t.timestamp :parking_end_time

      t.timestamps
    end
  end
end
