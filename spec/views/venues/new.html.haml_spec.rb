require 'spec_helper'

describe "venues/new" do
  before(:each) do
    assign(:venue, stub_model(Venue,
      :nombre => "MyString",
      :direccion => "MyString",
      :latitud => 1.5,
      :longitud => 1.5
    ).as_new_record)
  end

  it "renders new venue form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", venues_path, "post" do
      assert_select "input#venue_nombre[name=?]", "venue[nombre]"
      assert_select "input#venue_direccion[name=?]", "venue[direccion]"
      assert_select "input#venue_latitud[name=?]", "venue[latitud]"
      assert_select "input#venue_longitud[name=?]", "venue[longitud]"
    end
  end
end
