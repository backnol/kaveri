require 'spec_helper'

describe PagesController do
  describe 'routing' do
    it 'routes root to #home' do
      get('/').should route_to('pages#home')
    end
  end
end