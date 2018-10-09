class ShopsController < ApplicationController
  def index
    @shops = Shop.order(created_at: :desc).page(params[:page]).per(10)
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
    @shop = Shop.find(params[:id])

    if @shop.update(shop_params)
      flash[:success] = '紹介店は正常に更新されました'
      redirect_to @shop
    else
      flash.now[:danger] = '紹介店は更新されませんでした'
      render :edit
    end
  end

  def destroy
    @shop = Shop.find(params[:id])
    @shop.destroy

    flash[:success] = '紹介店は正常に削除されました'
    redirect_to shops_url
  end
  
  private

  # Strong Parameter
  def shop_params
    params.require(:shop).permit(:content, :title)
  end
  
end
