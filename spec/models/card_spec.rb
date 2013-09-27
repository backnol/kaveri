require 'spec_helper'

describe Card do
  # Attribute validations
  # Title
  it { should have_db_column(:title).of_type :string }
  it { should ensure_length_of(:title).is_at_least(1).is_at_most(255) }

  # url
  it { should have_db_column(:link).of_type :string }
  it { should_not allow_value('blah').for(:link)}
  it { should_not allow_value('www.google.com').for(:link)}
  it { should allow_value('http://www.google.com').for(:link)}
  
  # Origin  
  it { should have_db_column(:origin).of_type(:integer) }
  it { should ensure_inclusion_of(:origin).in_array(%w[:local, :twitter, :instagram, :google_plus, :pintrest]) }

  describe 'should set origin from sym' do
    it 'for twitter' do
      card = FactoryGirl.build(:card)
      card.originated_network = :twitter
      card.origin.should == 1
    end

    it 'for instagram' do
      card = FactoryGirl.build(:card)
      card.originated_network = :instagram
      card.origin.should == 2
    end

    it 'for google+' do
      card = FactoryGirl.build(:card)
      card.originated_network = :google_plus
      card.origin.should == 3
    end

    it 'for pintrest' do
      card = FactoryGirl.build(:card)
      card.originated_network = :pintrest
      card.origin.should == 4
    end
  end
  
  describe 'should return originated network' do
    it 'for twitter' do
      card = FactoryGirl.build(:card, origin: 1)
      card.originated_network.should == :twitter
    end

    it 'for instagram' do
      card = FactoryGirl.build(:card, origin: 2)
      card.originated_network.should == :instagram
    end

    it 'for google+' do
      card = FactoryGirl.build(:card, origin: 3)
      card.originated_network.should == :google_plus
    end

    it 'for pintrest' do
      card = FactoryGirl.build(:card, origin: 4)
      card.originated_network.should == :pintrest
    end
  end
  
  # Poster At
  it { should have_db_column(:posted_at).of_type(:datetime) }
  it { should validate_presence_of :posted_at }
  
  # Associations
  it { should belong_to :user }
end
