class BooksController < ApplicationController
  def index
    @books= Book.all
  end

  def show
    @book = Book.find(params[:id])
    @sum_rating = @book.reviews.reduce(0) do |sum, rating|
        sum + review.rating
      end
      @average_rating = @sum_rating / @book.reviews.length
      @meeting = Meeting.find(params[:meeting_id])
      @club = Club.find(@book.club_id)
    end



  def new
    @meeting = Meeting.find(params[:meeting_id])
    @book = @meeting.books.new
  end

  def create
    @meeting = Meeting.find(params[:meeting_id])
    @meeting.books.create!(book_params.merge(user: current_user))


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
    if @book.user == current_user
        @book.update(book_params)
    else
      flash[:alert] = "Only the creater can edit"
    end

    redirect_to meeting_path(@meeting)
  end

  # destroy
  def destroy
    @book = Book.find(params[:id])
    @meeting = Meeting.find(params[:meeting_id])
    if @book.user == current_user
    @book.destroy
  else
    flash[:alert] = "Only creater delete"
  end
    redirect_to meeting_path(@meeting)
  end

private

def book_params
  params.require(:book).permit(:title,:author, :photo_url, :description, :link, :genre)
end
end
