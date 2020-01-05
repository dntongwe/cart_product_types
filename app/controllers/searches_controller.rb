class SearchesController < ApplicationController

def new
  @search = Search.new
end

def create
  @search = Search.create!(search_params)
  redirect_to @search
end

def show
  @products = Search.find(params[:id]).products.page(params[:page]).per_page(10) 
end
private	

def search_params
	params.require(:search).permit(:keywords, :category_id, :min_price, :max_price)
end


end
