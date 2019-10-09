class ParkedVehical < ApplicationRecord
  belongs_to  :parking_slot

  def mark_parking_slot_busy
    self.parking_slot.update_attributes(available: false)
  end

  def mark_parking_slot_free
    self.parking_slot.update_attributes(available: true)
  end

end
