class SearchesController < ApplicationController
  def account
    @users = client.user_search(params[:account_name])
  end

  def tweet
  end
end
