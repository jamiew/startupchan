ENV["RAILS_ENV"] = 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'

Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  config.mock_with :rspec

  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true

  config.include Devise::TestHelpers, :type => :controller
  config.render_views = true

  if !$memcache.nil?
    config.before(:each) do
      $memcache.flush_all
    end
  end
end

def requires_authentication
  flash[:alert].should match(/sign in/i)
  response.should redirect_to(new_user_session_path)
end
