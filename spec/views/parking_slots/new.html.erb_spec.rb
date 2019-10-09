require 'rails_helper'

RSpec.describe "parking_slots/new", type: :view do
  before(:each) do
    assign(:parking_slot, ParkingSlot.new(
      :sequence_number => 1,
      :available => false
    ))
  end

  it "renders new parking_slot form" do
    render

    assert_select "form[action=?][method=?]", parking_slots_path, "post" do

      assert_select "input[name=?]", "parking_slot[sequence_number]"

      assert_select "input[name=?]", "parking_slot[available]"
    end
  end
end
