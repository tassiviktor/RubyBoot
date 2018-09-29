source 'https://rubygems.org'

ruby '2.5.1'
gem 'rails'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
#gem 'rhebok'
gem 'redis', '~> 3.0'
gem 'bcrypt', '~> 3.1.7'
gem 'rack-cors'
gem 'connection_pool'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'rspec-rails'
end

group :development do
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
