class Prize < ActiveRecord::Base
  validates :description, presence: true;
  belongs_to :bet
end
