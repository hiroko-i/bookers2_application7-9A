class BooksController < ApplicationController
  def show
    @book = Book.find(params[:id])
    
  end

  def index
    @books = Book.all
  end

  def edit
  end
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
