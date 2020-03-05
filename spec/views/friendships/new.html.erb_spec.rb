require 'rails_helper'

RSpec.describe "friendships/new", type: :view do
  before(:each) do
    assign(:friendship, Friendship.new(
      :user_id => 1,
      :friend_id => 1,
      :create => "MyString",
      :destroy => "MyString"
    ))
  end

  it "renders new friendship form" do
    render

    assert_select "form[action=?][method=?]", friendships_path, "post" do

      assert_select "input[name=?]", "friendship[user_id]"

      assert_select "input[name=?]", "friendship[friend_id]"

      assert_select "input[name=?]", "friendship[create]"

      assert_select "input[name=?]", "friendship[destroy]"
    end
  end
end
