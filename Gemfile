source "https://rubygems.org"

ruby "2.3.1"

gem "autoprefixer-rails"
gem "bourbon"
gem "flutie"
gem "jquery-rails"
gem "haml"
gem "listen"
gem "normalize-rails", "~> 3.0.0"
gem "rails", "~> 5.0.0"
gem "sass-rails", "~> 5.0"
gem "simple_form"
gem "sprockets", ">= 3.0.0"
gem "sqlite3"
gem "suspenders"
gem "turbolinks"
gem "uglifier"

gem "whowas"

group :development do
  gem "spring"
  gem "spring-commands-rspec"
  gem "web-console"
end

group :development, :test do
  gem "awesome_print"
  gem "bullet"
  gem "bundler-audit", ">= 0.5.0", require: false
  gem "dotenv-rails"
  gem "factory_girl_rails"
  gem "pry-byebug"
  gem "pry-rails"
  gem "refills"
  gem "rspec-rails", "~> 3.5.0.beta4"
end

group :development, :staging do
  gem "rack-mini-profiler", require: false
end

group :test do
  gem "capybara-webkit"
  gem "database_cleaner"
  gem "formulaic"
  gem "launchy"
  gem "shoulda-matchers"
  gem "simplecov", require: false
  gem "timecop"
  gem "webmock"
end

group :staging, :production do
  gem "rack-timeout"
end
