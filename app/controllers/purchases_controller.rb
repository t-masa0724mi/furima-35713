class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :ensure_user, only: [:index, :create]
  before_action :ensure, only: [:index, :create]

  def index
    @purchase  = PurchaseShippingAddress.new
  end

  # def new
    
  # end
  
  def create

    @purchase = PurchaseShippingAddress.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      redirect_to root_path
    else
      render action: :index
    end  
  end
  
  private
  
  def purchase_params
    params.require(:purchase_shipping_address).permit(:postal_code, :shipping_area_id, :municipality, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end  

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price, 
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def ensure_user
    if current_user.id == @item.user_id
      redirect_to root_path
    end  
  end    

  def ensure
    if  @item.purchase.present?
      redirect_to root_path    
    end  
  end

end
