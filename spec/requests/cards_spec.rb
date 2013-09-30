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
      cards.first['link'].should eq 'http://www.google.com'
      cards.first['originated_network'].should eq 'twitter'
      cards.first['image_url'].should eq 'http://distilleryimage11.ak.instagram.com/62daa12ad2c211e292fc22000a1f9806_7.jpg'
    end
  end
end
