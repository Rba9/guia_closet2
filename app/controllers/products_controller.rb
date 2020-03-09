class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to @product
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    if @product.save
      redirect_to @product, notice: "El product fue guardado exitosamente."
    else
      redirect_to new_product_path, alert: "El product no pudo ser guardado. Hay campos vacíos obligatorios."
    end
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      redirect_to products_path, notice: "El product fue eliminado con sucesso."
    else
      redirect_to @product, alert: "El product no pudo ser eliminado."
    end
  end

  private
    def product_params
      params.require(:product).permit(:image, :name, :description)
    end
end
