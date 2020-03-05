require 'rails_helper'

RSpec.describe "friendships/edit", type: :view do
  before(:each) do
    @friendship = assign(:friendship, Friendship.create!(
      :user_id => 1,
      :friend_id => 1,
      :create => "MyString",
      :destroy => "MyString"
    ))
  end

  it "renders the edit friendship form" do
    render

    assert_select "form[action=?][method=?]", friendship_path(@friendship), "post" do

      assert_select "input[name=?]", "friendship[user_id]"

      assert_select "input[name=?]", "friendship[friend_id]"

      assert_select "input[name=?]", "friendship[create]"

      assert_select "input[name=?]", "friendship[destroy]"
    end
  end
end
