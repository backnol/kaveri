require 'spec_helper'
include Rack::Test::Methods
describe "Cards", :type => :api do
  describe "GET /cards" do
    it 'returns all the cards' do
      3.times { FactoryGirl.create(:card) }
      get cards_path
      response.status.should eql(200)
      cards = JSON.parse(response.body)
      cards.size.should == 3
    end
  end

  describe 'GET /cards/:id' do
    it 'returns single card' do
      card = FactoryGirl.create(:card)
      get cards_path(card)
      response.status.should eql(200)
      cards = JSON.parse(response.body)
      cards.size.should == 1
      cards.first['title'].should eq card.title
    end
  end
end
