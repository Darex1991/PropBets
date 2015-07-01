class Bet < ActiveRecord::Base
  belongs_to :user
  has_one :prize, dependent: :destroy
  accepts_nested_attributes_for :prize
end
