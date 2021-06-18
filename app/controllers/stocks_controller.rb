class StocksController < ApplicationController
  def search
    if params[:stock].present?
      @stock = Stock.new_lookup(params[:stock])
      if @stock
        render "users/my_portfolio"
      end
      flash[:alert] = "Please enter a valid symbol to search"
      redirect_to my_portfolio_path
    else
      flash[:alert] = "Please enter a symbol to search"
      redirect_to my_portfolio_path
    end
  end
end
