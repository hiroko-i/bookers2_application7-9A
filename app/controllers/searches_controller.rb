class SearchesController < ApplicationController
  
  def search
    @range = params[:range]
    if @range == "User"
      @searchword = params[:searchword]
      @how=  params[:how]
      @users = User.looks(@searchword,@how)
    else
      @searchword = params[:searchword]
      @how=  params[:how]
      @books = Book.looks(@searchword,@how)
    end
  end
  
end
