require('spec_helper')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('The path of the website', :type => :feature) do

  describe('the band pages') do
    it('visits the creating a band and entering the detail page') do
    visit('/')
    click_link("Click here to check out your bands that ROCK!")
    fill_in("band_name", with: "The Bosstones")
    click_button('add that band!')
    click_link("The bosstones")
    expect(page).to have_content('The bosstones')
    end
  end

  describe('adding venues to bands') do
    it('visits the page, creates a band, creates a venue, then adds the venue to the band') do
    visit('/')
    click_link("Click here to check out your bands that ROCK!")
    fill_in("band_name", with: "The Bosstones")
    click_button('add that band!')
    click_link("The bosstones")
    fill_in("venue_name", with: "The Grand Concert Hall")
    click_button("add that venue!")
    expect(page).to have_content("The grand concert hall")
    end
  end
end
