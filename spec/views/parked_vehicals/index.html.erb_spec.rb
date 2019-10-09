require 'rails_helper'

RSpec.describe "parked_vehicals/index", type: :view do
  before(:each) do
    assign(:parked_vehicals, [
      ParkedVehical.create!(
        :parking_slot_id => 2,
        :vehical_no_plate => "MyText"
      ),
      ParkedVehical.create!(
        :parking_slot_id => 2,
        :vehical_no_plate => "MyText"
      )
    ])
  end

  it "renders a list of parked_vehicals" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
