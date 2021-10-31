class SearchesController < ApplicationController
  
  def search
    @range = params[:range]
    if @range == "User"
      @users = User.looks(params[:searchword],params[:how])
    else
      @books = Book.looks(params[:searchword],params[:how])
    end
  end
  
end
