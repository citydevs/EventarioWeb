require 'spec_helper'

describe "venues/show" do
  before(:each) do
    @venue = assign(:venue, stub_model(Venue,
      :nombre => "Nombre",
      :direccion => "Direccion",
      :latitud => 1.5,
      :longitud => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nombre/)
    rendered.should match(/Direccion/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
  end
end
