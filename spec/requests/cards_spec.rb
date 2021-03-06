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
      card = FactoryGirl.create(:card, originated_network: :twitter)
      get cards_path(card)
      response.status.should eql(200)
      cards = JSON.parse(response.body)
      cards.size.should == 1
      cards.first['title'].should eq 'This title is is the bomb'
      cards.first['embed_html'].should eq "<h2>Hey Hey Hey! H2 in da house</h2>"
      cards.first['originated_network'].should eq 'twitter'
    end
  end
end
