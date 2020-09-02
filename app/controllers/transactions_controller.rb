class TransactionsController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @transaction = Transaction.new
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id || @item.contract
  end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)
    @item = Item.find(params[:item_id])
    
    if @transaction.valid?
      pay_item
      @transaction.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: transaction_params[:token],
      currency: 'jpy'
    )
  end
  
end
