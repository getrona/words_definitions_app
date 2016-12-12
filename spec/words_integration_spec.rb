require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application

describe("testing the site", {:type => :feature}) do
  before()do
    Word.clear
  end
  
  describe('/') do
    it('routes to the home path') do
      visit('/')
      expect(page).to have_content('Rubyist Dictionary')
    end
  end
  
  describe('/word/new') do
  it('will make a totally new word') do
      visit('/')
      click_link('ADD A Word')
      fill_in('word_input, :with=> "ruby")
      click_button('Add Word')
      expect(page).to have_content('Your Changes Have Been Saved!')
    end
  end
