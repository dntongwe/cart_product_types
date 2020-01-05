class ProductsController < ApplicationController
  def index
    # @products = Product.order("name").page(params[:page]).per_page(5)
    @products = Product.search(params[:search]).page(params[:page]).per_page(10)
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    #@product = Product.new
    product_type = ProductType.find(params[:product_type_id])
    @product = Product.new(product_type_id: params[:product_type_id])
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product, :notice => "Successfully created product."
    else
      render :action => 'new'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(product_params)
      redirect_to @product, :notice  => "Successfully updated product."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_url, :notice => "Successfully destroyed product."
  end

  private

  def product_params
      #params.require(:product).permit(:price, :name, :description, :released_at, :category_id, :parent_id, :category_name,:product_type_id).tap do |whitelisted|
      #whitelisted[:properties] = params[:product][:properties]
      #end
      field_types = ProductField.all.map(&:name)
      params.require(:product).permit(:price, :name, :description, :released_at, :category_id, :parent_id, :category_name, :product_type_id, :properties=>[field_types])
  end
end
