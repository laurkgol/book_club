class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
    @book = book.find(@review.book_id)
  end

  def new
    @book = Book.find(params[:book_id])
    @review = @book.reviews.new

  end

  def create
    @book = Book.find(params[:book_id])
    @club = Club.find(@book.club_id)
    @meeting = Meeting.find(@book.meeting_id)
   @book.reviews.create(review_params.merge(user: current_user))

    redirect_to club_meeting_path(@club, @meeting)
end

def edit
    @review = Review.find(params[:id])
    @book = Book.find(params[:book_id])


  end

  # update
  def update
    @review = Review.find(params[:id])

    @book = Book.find(params[:book_id])
    @meeting = Meeting.find(@book.meeting_id)
    if @review.user == current_user
      @review.update(review_params)
    else
      flash[:alert] = "Only the author of the review can edit"
    end
    redirect_to meeting_path(@meeting)
  end

  # destroy
  def destroy
    @book = Book.find(params[:book_id])
    @review = Review.find(params[:id])
    @meeting = Meeting.find(@book.meeting_id)
    if @review.user == current_user
    @review.destroy
  else
    flash[:alert] = "Only the author of the review can delete"
  end

  redirect_to book_review_path(@book, @review)
  end

private

def review_params
  params.require(:review).permit(:rating, :comment)
end


end
