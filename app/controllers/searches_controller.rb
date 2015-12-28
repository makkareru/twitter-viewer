class SearchesController < ApplicationController
  def account
    @accounts = client.user_search(params[:account_name])
    @account = Account.new
    @client = client
  end

  def tweet
  end
end
