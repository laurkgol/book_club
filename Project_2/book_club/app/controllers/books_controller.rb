class BooksController < ApplicationController
  def index
    @books= Books.all
  end

  def show
    @book = Book.find(params[:id])
    @meeting = Meeting.find(@book.meeting_id)
    @club = Club.find(@book.club_id)
  end

  def new
    @meeting = Meeting.find(params[:meeting_id])
    @book = @meeting.books.new

  end

  def create
    @meeting = Meeting.find(params[:meeting_id])
    @club = Club.find(@meeting.club_id)
   @meeting.books.create(book_params)

    redirect_to meeting_path(@meeting)
end

def edit
    @book = Book.find(params[:id])
    @meeting = Meeting.find(params[:meeting_id])

  end

  # update
  def update
    @meeting = Meeting.find(params[:meeting_id])
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to meeting_book_path(@meeting, @book)
  end

  # destroy
  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    redirect_to books_path
  end

private

def book_params
  params.require(:book).permit(:title,:author, :photo_url, :description, :link, :genre)
end
end
