require 'rails_helper'

RSpec.describe 'the show all books by that author page' do
  it 'lists each book by the author' do
    author1 = Author.create!(name: 'Stephen King', location: 'Maine', years_active: 42, living: true)
    author2 = Author.create!(name: 'John Steinbeck', living: false, location: "California, USA", years_active: 40)
    book1 = author1.books.create!(name: 'The Gunslinger', available_as_audiobook: true, page_length: 223, genre: 'Fantasy/Western')
    book2 = author1.books.create!(name: 'Carrie', available_as_audiobook: false, page_length: 526, genre: 'Horror')
    book3 = author1.books.create!(name: 'Wizard and Glass', available_as_audiobook: true, page_length: 657, genre: 'Fantasy/Western')
    book4 = author2.books.create!(name: 'Grapes of Wrath', available_as_audiobook: false, page_length: 425, genre: 'Historical Fiction')

    visit "/authors/#{author1.id}/books"

    expect(page).to have_content(author1.name)
    expect(page).to have_content(book1.name)
    expect(page).to have_content(book2.name)
    expect(page).to have_content(book3.name)
    expect(page).to_not have_content(book4.name)
  end

  it 'includes attributes of the books' do
    author1 = Author.create!(name: 'Stephen King', location: 'Maine', years_active: 42, living: true)
    book1 = author1.books.create!(name: 'The Gunslinger', available_as_audiobook: true, page_length: 223, genre: 'Fantasy/Western')
    book2 = author1.books.create!(name: 'Carrie', available_as_audiobook: false, page_length: 526, genre: 'Horror')
    book3 = author1.books.create!(name: 'Wizard and Glass', available_as_audiobook: true, page_length: 657, genre: 'Fantasy/Western')

    visit "/authors/#{author1.id}/books"

    expect(page).to have_content(book1.available_as_audiobook)
    expect(page).to have_content(book1.page_length)
    expect(page).to have_content(book2.page_length)
    expect(page).to have_content(book3.genre)
    expect(page).to have_content(book3.genre)
  end

  it 'has a link to the authors index page' do   
    author1 = Author.create!(name: 'Stephen King', location: 'Maine', years_active: 42, living: true)

    visit "/authors/#{author1.id}/books"

    expect(page).to have_link('Authors', href:"/authors")
  end
end
