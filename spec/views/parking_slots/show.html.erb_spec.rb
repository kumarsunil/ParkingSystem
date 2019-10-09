require 'rails_helper'

RSpec.describe "parking_slots/show", type: :view do
  before(:each) do
    @parking_slot = assign(:parking_slot, ParkingSlot.create!(
      :sequence_number => 2,
      :available => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/false/)
  end
end
