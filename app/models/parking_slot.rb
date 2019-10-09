class ParkingSlot < ApplicationRecord
  has_one :parked_vehical
  scope :available_slot, -> { where(available: true).order(:sequence_number) }
end
