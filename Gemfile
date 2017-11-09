source 'https://rubygems.org'
ruby '2.4.2'

git_source(:github) do |repo_name|
    repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
    "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.1.4'

group :production do
   gem 'pg'
end

group :development do
    gem 'sqlite3'
end

gem 'puma', '~> 3.7'

gem 'sass-rails', '~> 5.0'

gem 'uglifier', '>= 1.3.0'

gem 'coffee-rails', '~> 4.2'

gem 'jquery-rails'

gem 'turbolinks', '~> 5'

gem 'jbuilder', '~> 2.5'

gem 'bootstrap-sass'

gem 'devise'

group :development, :test do
    gem 'rspec-rails', '~> 3.6'
    gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
    gem 'web-console', '>= 3.3.0'
    gem 'listen', '>= 3.0.5', '< 3.2'
    gem 'spring'
    gem 'spring-watcher-listen', '~> 2.0.0'
end