require 'rails_helper'

RSpec.describe "parking_slots/edit", type: :view do
  before(:each) do
    @parking_slot = assign(:parking_slot, ParkingSlot.create!(
      :sequence_number => 1,
      :available => false
    ))
  end

  it "renders the edit parking_slot form" do
    render

    assert_select "form[action=?][method=?]", parking_slot_path(@parking_slot), "post" do

      assert_select "input[name=?]", "parking_slot[sequence_number]"

      assert_select "input[name=?]", "parking_slot[available]"
    end
  end
end
