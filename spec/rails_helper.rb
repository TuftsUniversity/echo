if ENV["CODECLIMATE_REPO_TOKEN"]
  require "codeclimate-test-reporter"
  CodeClimate::TestReporter.configure do |config|
    config.logger.level = Logger::WARN
  end
  CodeClimate::TestReporter.start
end

if ENV["COVERAGE"]
  require "simplecov"
  SimpleCov.start "rails" do
    add_filter "app/whowas/recipes/"
  end
end

ENV["RACK_ENV"] = "test"

require File.expand_path("../../config/environment", __FILE__)
abort("DATABASE_URL environment variable is set") if ENV["DATABASE_URL"]

require "rspec/rails"
require "capybara/rspec"

if ENV["SCREENSHOT"]
  require "capybara-screenshot/rspec"
end

Capybara.javascript_driver = :webkit
Capybara.current_driver = :webkit
Capybara.default_max_wait_time = 10

Dir[Rails.root.join("spec/support/**/*.rb")].sort.each { |file| require file }

module Features
  # Extend this module in spec/support/features/*.rb
  include Formulaic::Dsl
end

RSpec.configure do |config|
  config.include Features, type: :feature
  config.include Support  
  config.infer_base_class_for_anonymous_controllers = false
  config.infer_spec_type_from_file_location!
  config.use_transactional_fixtures = false
  
  config.include Warden::Test::Helpers
  config.after :each do
    Warden.test_reset!
  end

  # Ladle (LDAP) server
  config.add_setting :ldap_server
  config.before(:example, type: :ldap) do
    RSpec.configuration.ldap_server = Ladle::Server.new(
      ldif: "ldap_users.ldif",      
      quiet: true
    ).start
  end
  config.after(:example, type: :ldap) do
    RSpec.configuration.ldap_server.stop if RSpec.configuration.ldap_server
    RSpec.configuration.ldap_server = nil
  end
end

ActiveRecord::Migration.maintain_test_schema!
