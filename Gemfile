source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

ruby '2.5.0'

#=== CORE =====================================================================
gem 'rails', '~> 5.1.5'

# gem 'capistrano', '~> 3.0'
# gem 'capistrano-rvm'
# gem 'devise', '~> 4.3.0'
gem 'jbuilder', '~> 2.5'
# gem 'paperclip', '~> 5.0.0'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.7'
# gem 'pundit'
# gem 'rails-observers'
gem 'simple_command'
gem 'unicorn'

#=== UI =======================================================================
gem 'bootstrap', '~> 4.0.0'
gem 'font-awesome-rails', '~> 4.7', '>= 4.7.0.1'
gem 'html2slim', '~> 0.2.0'
gem 'jquery-rails', '~> 4.3.1'
gem 'sass-rails', '~> 5.0'
# gem 'simple_form'
gem 'slim-rails', '~> 3.1', '>= 3.1.2'
# gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

#=== FEATURES =================================================================
gem 'twilio-ruby', '~> 5.6.3'
gem 'rspotify', '~> 1.16'

#=== CONFIG ===================================================================
gem 'dotenv-rails', '~> 2.2'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

#=== DEV & TEST ===============================================================
group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'pry-nav', '~> 0.2.4'
  gem 'pry-rails', '~> 0.3.6'
  # gem 'selenium-webdriver'
end

group :development do
  gem 'bullet'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rubocop', '~> 0.49'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '~> 2.17'
  # gem 'capybara-webkit', '~> 1.1.0'
  gem 'database_cleaner', '~> 1.5', '>= 1.5.3'
  gem 'faker', '~> 1.7.3'
  # gem 'rack_session_access', '~> 0.1.1'
  gem 'rspec-rails', '~> 3.5', '>= 3.5.2'
  gem 'shoulda-matchers', '~> 3.1', '>= 3.1.1'
  gem 'simplecov', '~> 0.14.1'
  gem 'webmock', '~> 2.3', '>= 2.3.2'
end
