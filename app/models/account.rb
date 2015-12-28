class Account < ActiveRecord::Base
  serialize :follows
  serialize :followers
end
