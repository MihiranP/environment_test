# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'JK Rowling'
    fill_in 'Price', with: '10.21'
    select '2021', :from => 'book_published_date_1i'
    select 'February', :from => 'book_published_date_2i'
    select '3', :from => 'book_published_date_3i'
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('harry potter')
    expect(page).to have_content('JK Rowling')
    expect(page).to have_content('10.21')
    expect(page).to have_content('2021-02-03')
  end
end