class Bet < ActiveRecord::Base
  belongs_to :user
  has_one :prize
  accepts_nested_attributes_for :prize
end
