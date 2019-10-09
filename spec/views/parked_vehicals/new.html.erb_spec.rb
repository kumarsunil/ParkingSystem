require 'rails_helper'

RSpec.describe "parked_vehicals/new", type: :view do
  before(:each) do
    assign(:parked_vehical, ParkedVehical.new(
      :parking_slot_id => 1,
      :vehical_no_plate => "MyText"
    ))
  end

  it "renders new parked_vehical form" do
    render

    assert_select "form[action=?][method=?]", parked_vehicals_path, "post" do

      assert_select "input[name=?]", "parked_vehical[parking_slot_id]"

      assert_select "textarea[name=?]", "parked_vehical[vehical_no_plate]"
    end
  end
end
