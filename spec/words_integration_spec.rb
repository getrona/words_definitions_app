require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application



describe("testing the site", {:type => :feature}) do
  before() do
    Words.clear()
  end

  describe('/') do
    it('routes to the home path') do
      visit('/')
      expect(page).to have_content('Rubyist Dictionary')
    end
  end

  describe('/words/new') do
  it('will make a totally new word') do
      visit('/')
      click_link('ADD A Word')
      fill_in('word_input', :with=> "ruby")
      click_button('Add Word')
      expect(page).to have_content('Your Changes Have Been Saved!')
    end
  end

  describe('/define/:id') do
  it('will add a definition to a word') do
      visit('/')
      click_link('ADD A Word')
      fill_in('word_input', :with=> "ruby")
      click_button('Add Word')
      click_link('Home')
      click_link('ruby')
      click_link('Add a Definition')
      fill_in('define_input', :with=> "buro")
      click_button('Add Definition')
      expect(page).to have_content('buro')
    end
  end
end
