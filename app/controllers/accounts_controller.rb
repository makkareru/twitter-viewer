class AccountsController < ApplicationController
  def index
    @accounts = Account.all
  end

  def create
    @account = Account.new(account_params)
    unless @account.save
      render 'new'
    end
    redirect_to accounts_path, notice: "登録しました"
  end

  def diff
  end

private
  def account_params
    params(:account).permit(:name,:screen_name,:followers,:follows)
  end
end
