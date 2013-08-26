require 'spec_helper'

describe PagesController do
  describe 'GET home' do
    it 'assigns all cards as @cards' do
      card = FactoryGirl.create :card
      get :home
      assigns(:cards).should eq [card]
    end
  end
end
