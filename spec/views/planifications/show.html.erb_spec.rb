require 'rails_helper'

RSpec.describe "planifications/show", type: :view do
  before(:each) do
    @planification = assign(:planification, Planification.create!(
      :year => 2,
      :user => nil,
      :possibility => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
