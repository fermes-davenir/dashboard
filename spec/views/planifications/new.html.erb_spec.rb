require 'rails_helper'

RSpec.describe "planifications/new", type: :view do
  before(:each) do
    assign(:planification, Planification.new(
      :year => 1,
      :user => nil,
      :possibility => nil
    ))
  end

  it "renders new planification form" do
    render

    assert_select "form[action=?][method=?]", planifications_path, "post" do

      assert_select "input[name=?]", "planification[year]"

      assert_select "input[name=?]", "planification[user_id]"

      assert_select "input[name=?]", "planification[possibility_id]"
    end
  end
end
