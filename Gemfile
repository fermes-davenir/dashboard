source 'https://rubygems.org'

gem 'rails', '~> 5.1'
gem 'rb-readline'
gem 'jbuilder', '~> 2.0'
gem 'sass-rails', '~> 5.0'
gem 'puma'
gem 'uglifier'
gem 'turbolinks', '~> 5'
gem 'devise'
gem 'webpacker', '~> 3.2'
gem 'pg'
gem 'bootstrap-sass'
gem 'rails_admin', github: 'dtcristo/rails_admin', branch: 'active_storage'
gem "aws-sdk-s3", require: false
gem 'mini_magick'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'rspec-rails'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rails-erd'

  gem 'capistrano', '~> 3.4'
  gem 'capistrano-rails', '~> 1.1'
  gem 'capistrano-rvm', '~> 0.1.2'
  gem 'capistrano3-puma', github: "seuros/capistrano-puma"
end

group :production do
  gem 'rails_12factor'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
