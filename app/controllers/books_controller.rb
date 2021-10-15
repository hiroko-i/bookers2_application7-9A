class BooksController < ApplicationController
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book)
    else
      @books = Book.all
      render :index
    end
  end
  
  def show
    # 下記のbookに対する親モデuserのデータの書き方
    @book = Book.find(params[:id])
    
  end

  def index
    @user = current_user
    @book = Book.new
    @books = Book.all
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    @book.user_id = current_user.id
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book)
    else
      render :edit
    end
  end
  
  def destroy
    @book = Book.find(params[:id])
    # @user = User.find_by(profile_image_id: params[:profile_image_id] )
    @book.destroy
    redirect_to books_path
  end

  
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
