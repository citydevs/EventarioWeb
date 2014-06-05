require 'spec_helper'

describe "venues/index" do
  before(:each) do
    assign(:venues, [
      stub_model(Venue,
        :nombre => "Nombre",
        :direccion => "Direccion",
        :latitud => 1.5,
        :longitud => 1.5
      ),
      stub_model(Venue,
        :nombre => "Nombre",
        :direccion => "Direccion",
        :latitud => 1.5,
        :longitud => 1.5
      )
    ])
  end

  it "renders a list of venues" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nombre".to_s, :count => 2
    assert_select "tr>td", :text => "Direccion".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
