class ShopsController < ApplicationController
  def index
    @shops = Shop.all
  end

  def show
    @shop = Shop.find(params[:id])
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)

    if @shop.save
      flash[:success] = '紹介店が正常に投稿されました'
      redirect_to @shop
    else
      flash.now[:danger] = '紹介店が投稿されませんでした'
      render :new
    end
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
  end

  def destroy
  end
  
  private

  # Strong Parameter
  def shop_params
    params.require(:shop).permit(:content)
  end
  
end
