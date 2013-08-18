require 'spec_helper'

describe "cards/new" do
  before(:each) do
    assign(:card, stub_model(Card,
      :title => "MyString",
      :origin => 1,
      :user_id => 1
    ).as_new_record)
  end

  it "renders new card form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", cards_path, "post" do
      assert_select "input#card_title[name=?]", "card[title]"
      assert_select "input#card_origin[name=?]", "card[origin]"
      assert_select "input#card_user_id[name=?]", "card[user_id]"
    end
  end
end
