require 'rails_helper'

RSpec.describe "possibilities/index", type: :view do
  before(:each) do
    assign(:possibilities, [
      Possibility.create!(
        :nursery_time => 2,
        :seed_week => 3,
        :harvest_week => 4,
        :user => nil,
        :plant => nil
      ),
      Possibility.create!(
        :nursery_time => 2,
        :seed_week => 3,
        :harvest_week => 4,
        :user => nil,
        :plant => nil
      )
    ])
  end

  it "renders a list of possibilities" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
