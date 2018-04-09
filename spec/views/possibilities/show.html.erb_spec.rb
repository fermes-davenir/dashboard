require 'rails_helper'

RSpec.describe "possibilities/show", type: :view do
  before(:each) do
    @possibility = assign(:possibility, Possibility.create!(
      :nursery_time => 2,
      :seed_week => 3,
      :harvest_week => 4,
      :user => nil,
      :plant => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
