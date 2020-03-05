require 'rails_helper'

RSpec.describe "friendships/index", type: :view do
  before(:each) do
    assign(:friendships, [
      Friendship.create!(
        :user_id => 2,
        :friend_id => 3,
        :create => "Create",
        :destroy => "Destroy"
      ),
      Friendship.create!(
        :user_id => 2,
        :friend_id => 3,
        :create => "Create",
        :destroy => "Destroy"
      )
    ])
  end

  it "renders a list of friendships" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Create".to_s, :count => 2
    assert_select "tr>td", :text => "Destroy".to_s, :count => 2
  end
end
