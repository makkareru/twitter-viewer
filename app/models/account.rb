class Account < ActiveRecord::Base
  serialize :follows, Array
  serialize :followers, Array
end
