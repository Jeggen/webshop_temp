class Admin::ProductsController < Admin::BaseController
  def index
    @products = Product.all
    @categories = Category.all
  end

  def new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :unit_price, :stock, :color, :category_id)
  end
end
