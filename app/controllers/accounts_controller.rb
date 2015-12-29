class AccountsController < ApplicationController
  def index
    @accounts = Account.all
  end

  def create
    p params.permit(follows: [])
    p params.permit(followers: [])
    @account = Account.create(account_params)
    @account.update(params.permit(follows: []))
    @account.update(params.permit(followers: []))
    @account.save
    redirect_to accounts_path, notice: "登録しました"
  end

  def diff
    @accounts = Account.where(screen_name: params[:target])
    @results = accounts_diff
  end

private

  def account_params
    params.require(:account).permit(:account_id,:name,:screen_name)
  end

  def accounts_diff
    @client = client
    type = params[:type]
    results = Array.new
    util = Array.new
    case type
    when 'self_follow'
      @client.friend_ids(@accounts.first.screen_name).each { |f| util << f.to_s }
      results = @accounts.first.follows - util
      @accounts.first.follows = util
      @accounts.first.save
    when 'self_follower'
      @client.friend_ids(@accounts.first.screen_name).each { |f| util << f.to_s }
      results = @accounts.first.followers - util
      @accounts.first.followers = util
      @accounts.first.save
    when 'follow'
      results = @accounts.first.follows
      @accounts.each do |account|
        results = results & account.follows
      end
    when 'follower'
      results = @accounts.first.followers
      @accounts.each do |account|
        results = results & account.followers
      end
    end
    results
  end
end
