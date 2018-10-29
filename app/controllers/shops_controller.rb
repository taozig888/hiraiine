class ShopsController < ApplicationController
  
  before_action :require_user_logged_in, only: [:new, :create, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  #３行目は、ログインしていればでき操作の塊で、４行目は、その中でもあるユーザーしか操作できないかたまり？
  
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
    @shop = current_user.shops.build(shop_params) #ログインしている人なら操作（create）できる。
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
    params.require(:shop).permit(:content, :title, :picture)
  end
  
  def correct_user #あるユーザーしか操作（destroy edit update）できない。
    @shop = current_user.shops.find_by(id: params[:id]) #currentuserが持つshopsを見つけて、変数に入れている。
    unless @shop
      redirect_to root_url
    end
  end
  
end
