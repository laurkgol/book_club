class BooksController < ApplicationController
  def index
    @books= Books.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @club = Club.find(params[:book_id])
    @book = @club.books.new
  end
end
