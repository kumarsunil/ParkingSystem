require 'rails_helper'

RSpec.describe "parked_vehicals/edit", type: :view do
  before(:each) do
    @parked_vehical = assign(:parked_vehical, ParkedVehical.create!(
      :parking_slot_id => 1,
      :vehical_no_plate => "MyText"
    ))
  end

  it "renders the edit parked_vehical form" do
    render

    assert_select "form[action=?][method=?]", parked_vehical_path(@parked_vehical), "post" do

      assert_select "input[name=?]", "parked_vehical[parking_slot_id]"

      assert_select "textarea[name=?]", "parked_vehical[vehical_no_plate]"
    end
  end
end
