require 'rails_helper'

RSpec.describe "parking_slots/index", type: :view do
  before(:each) do
    assign(:parking_slots, [
      ParkingSlot.create!(
        :sequence_number => 2,
        :available => false
      ),
      ParkingSlot.create!(
        :sequence_number => 2,
        :available => false
      )
    ])
  end

  it "renders a list of parking_slots" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
