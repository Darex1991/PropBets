class Bet < ActiveRecord::Base
  belongs_to :user
  has_one :prize
end
