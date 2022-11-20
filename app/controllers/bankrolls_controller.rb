class BankrollsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @bankrolls = Bankroll.where(user_id: current_user.id)
  end 
  
  def create
    @bankroll = Bankroll.new(bankroll_params)
    @bankroll.save
    redirect_to bankrolls_path
  end 
  
  def edit
    @bankroll = Bankroll.find(params[:id])
  end 
  
  private
  
  def bankroll_params
    params.require(:bankroll).permit(:user_id,:playtime,:buy_in,:cash_out)
  end
end
