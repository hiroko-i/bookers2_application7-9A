class UsersController < ApplicationController
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.
    if @book.save
    flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render "books/index"
    end
  end
  
  
  def show
    @book = Book.new
    @user = User.find(params[:id])
  end

  def index
    
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
end
