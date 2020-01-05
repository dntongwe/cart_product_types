class CategoriesController < ApplicationController

	def index
		##prior to addition of ancestry
		##@categories = Category.order(:name).where("name like ?", "%#{params[:term]}%")
  		##render json: @categories.map(&:name)
  		@categories = Category.all
	end

	def new
		@category = Category.new
	end

	def show
		@category = Category.find(params[:id])
	end

	def edit
		@category = Category.find(params[:id])
	end

	def update
		@category = Category.find(params[:id])
		@category.update_attributes(category_params)
		@category.save
		redirect_to @category
	end

	def create
		@category = Category.create(category_params)
		if @category.save
		redirect_to @category
		else
			render 'new'
		end
	end

	def destroy
		@category = Category.find(params[:id])
		@category.destroy
		redirect_to categories_path
	end

	private

	def category_params
		params.require(:category).permit(:name, :parent_id, :content)
	end
end