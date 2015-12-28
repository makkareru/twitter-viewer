class TopController < ApplicationController
  def index
    if session['access_token'] && session['access_token_secret']
      @client = client
    end
  end
end
