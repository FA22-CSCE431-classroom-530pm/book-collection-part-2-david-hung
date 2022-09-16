# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'J. K. Rowling'
    fill_in 'Price', with: '9.99'
    fill_in 'Published date', with: '2022-10-12'
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('harry potter')
  end
end

RSpec.describe 'Edit a book', type: :feature do
  scenario 'change price of book' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'J. K. Rowling'
    fill_in 'Price', with: '9.99'
    fill_in 'Published date', with: '2022-10-12'
    click_on 'Create Book'
    visit edit_book_path(Book.find_by_title("harry potter"))
    fill_in 'Price', with: '19.99'
    click_button "Update Book"
    visit books_path
    expect(page).to have_content('19.99')
  end
end

RSpec.describe 'Delete a book', type: :feature do
  scenario 'creates and then deletes a book' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'J. K. Rowling'
    fill_in 'Price', with: '9.99'
    fill_in 'Published date', with: '2022-10-12'
    click_on 'Create Book'
    visit books_path
    find('tr', text: 'harry potter').click_link("Destroy")
    visit books_path
    expect(page).to have_no_content('harry potter')
  end
end

RSpec.describe 'Show a book', type: :feature do
  scenario 'creates and show book' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'J. K. Rowling'
    fill_in 'Price', with: '9.99'
    fill_in 'Published date', with: '2022-10-12'
    click_on 'Create Book'
    visit books_path
    find('tr', text: 'harry potter').click_link("Show")
    expect(page).to have_content('harry potter')
  end
end