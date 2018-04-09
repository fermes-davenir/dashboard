require 'rails_helper'

RSpec.describe "possibilities/edit", type: :view do
  before(:each) do
    @possibility = assign(:possibility, Possibility.create!(
      :nursery_time => 1,
      :seed_week => 1,
      :harvest_week => 1,
      :user => nil,
      :plant => nil
    ))
  end

  it "renders the edit possibility form" do
    render

    assert_select "form[action=?][method=?]", possibility_path(@possibility), "post" do

      assert_select "input[name=?]", "possibility[nursery_time]"

      assert_select "input[name=?]", "possibility[seed_week]"

      assert_select "input[name=?]", "possibility[harvest_week]"

      assert_select "input[name=?]", "possibility[user_id]"

      assert_select "input[name=?]", "possibility[plant_id]"
    end
  end
end
