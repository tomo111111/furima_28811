class TransactionsController < ApplicationController
  before_action :authenticate_user!, only: [:index]


  def index
    @transaction = Transaction.new
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id || @item.contract
      redirect_to root_path
    end
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
    params.permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number,:item_id,:token).merge(user_id:current_user.id)
  end

  def pay_item
    Payjp.api_key = "sk_test_c9d7e7bf7aa9ec64db88b4bd"
    Payjp::Charge.create(
      amount: @item.price,
      card: transaction_params[:token],
      currency:'jpy'
    )
  end
end
