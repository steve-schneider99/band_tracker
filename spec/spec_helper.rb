ENV['RACK_ENV'] = 'test'

require('sinatra/activerecord')
require('capybara/rspec')
require('rspec')
require('band')
require('venue')
require('pry')
require('pg')

RSpec.configure do |config|
  config.after(:each) do
    Band.all().each do |ingredient|
      ingredient.destroy()
    end
    Venue.all().each do |recipe|
      recipe.destroy()
    end
  end
end
