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
  it { should ensure_inclusion_of(:origin).in_array(%w[:local, twitter]) }
  context 'origin setter' do
    it 'for local post'
    it 'for tweet'
  end
  
  # Poster At
  it { should have_db_column(:posted_at).of_type(:datetime) }
  it { should validate_presence_of :posted_at }
  
  # Associations
  it { should belong_to :user }
end
