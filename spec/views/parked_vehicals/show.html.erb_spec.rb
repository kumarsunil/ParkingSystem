require 'rails_helper'

RSpec.describe "parked_vehicals/show", type: :view do
  before(:each) do
    @parked_vehical = assign(:parked_vehical, ParkedVehical.create!(
      :parking_slot_id => 2,
      :vehical_no_plate => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/MyText/)
  end
end
