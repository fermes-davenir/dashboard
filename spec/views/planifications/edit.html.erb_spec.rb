require 'rails_helper'

RSpec.describe "planifications/edit", type: :view do
  before(:each) do
    @planification = assign(:planification, Planification.create!(
      :year => 1,
      :user => nil,
      :possibility => nil
    ))
  end

  it "renders the edit planification form" do
    render

    assert_select "form[action=?][method=?]", planification_path(@planification), "post" do

      assert_select "input[name=?]", "planification[year]"

      assert_select "input[name=?]", "planification[user_id]"

      assert_select "input[name=?]", "planification[possibility_id]"
    end
  end
end
