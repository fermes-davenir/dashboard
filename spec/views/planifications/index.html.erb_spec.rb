require 'rails_helper'

RSpec.describe "planifications/index", type: :view do
  before(:each) do
    assign(:planifications, [
      Planification.create!(
        :year => 2,
        :user => nil,
        :possibility => nil
      ),
      Planification.create!(
        :year => 2,
        :user => nil,
        :possibility => nil
      )
    ])
  end

  it "renders a list of planifications" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
