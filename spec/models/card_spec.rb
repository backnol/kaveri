require 'spec_helper'

describe Card do
  # Attribute validations
  # Title
  it { should have_db_column(:title).of_type :string }
  it { should ensure_length_of(:title).is_at_least(1).is_at_most(255) }

  # url
  it { should have_db_column(:url).of_type :string }
  
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
  it { should have_one :post }
  it { should have_one :tweet }
  it { should belong_to :user }
end
