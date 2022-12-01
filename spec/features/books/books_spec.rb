require 'rails_helper'

RSpec.describe 'books index page' do
  describe 'as a visitor' do
    describe 'when i visit /books' do
      it 'shows each book in the system' do
        author1 = Author.create!(name: 'Stephen King', location: 'Maine', years_active: 42, living: true)
        author2 = Author.create!(name: 'John Steinbeck', living: false, location: "California, USA", years_active: 40)
        book1 = author1.books.create!(name: 'The Gunslinger', available_as_audiobook: true, page_length: 223, genre: 'Fantasy/Western')
        book2 = author2.books.create!(name: 'Grapes of Wrath', available_as_audiobook: true, page_length: 425, genre: 'Historical Fiction')

        visit "/books"

        expect(page).to have_content(book1.name)
        expect(page).to have_content(book2.name)
      end

      it 'shows attributes of each book' do
        author1 = Author.create!(name: 'Stephen King', location: 'Maine', years_active: 42, living: true)
        author2 = Author.create!(name: 'John Steinbeck', living: false, location: "California, USA", years_active: 40)
        book1 = author1.books.create!(name: 'The Gunslinger', available_as_audiobook: true, page_length: 223, genre: 'Fantasy/Western')
        book2 = author2.books.create!(name: 'Grapes of Wrath', available_as_audiobook: true, page_length: 425, genre: 'Historical Fiction')

        visit "/books"

        expect(page).to have_content(book1.available_as_audiobook)
        expect(page).to have_content(book1.page_length)
        expect(page).to have_content(book1.genre)
        expect(page).to have_content(book1.author.name)
        expect(page).to have_content(book2.available_as_audiobook)
        expect(page).to have_content(book2.page_length)
        expect(page).to have_content(book2.genre)
        expect(page).to have_content(book2.author.name)
      end
    end
  end
end