class Bet < ActiveRecord::Base
  validates :name, :description, presence: true
  validate :finish_date_cannot_be_in_the_past
  validate :start_date_cannot_be_later_then_finish_date
  # validate :start_date_cannot_be_in_the_past see comment above method
  belongs_to :creator, foreign_key: :creator_user_id, class_name: User
  belongs_to :taker, foreign_key: :taker_user_id, class_name: User
  belongs_to :winner, foreign_key: :winner_id, class_name: User
  has_one :prize, dependent: :destroy
  accepts_nested_attributes_for :prize
  attr_accessor :winner_code
  before_save :resolve_bet, if: :winner_code


  #not sure about this, maybe we can allow user to create bets they started in past
  #foe. they bet yesterted, and they can't use the app and wanted to add the bet today

  def resolve_bet
    self.winner = winner_code == 'taker' ? taker : creator
    self.state = 'Finished'
  end

  def is_protected?
    taker_user_id.nil?
  end

  def is_done?
    winner_id.nil?
  end

  def start_date_cannot_be_in_the_past
    errors.add(:start_on, "can't be in the past") if
        !start_on.blank? and start_on < Date.today
  end

  def start_date_cannot_be_later_then_finish_date
    errors.add(:start_on, "can't be later then finish date") if
        start_on > finish_on
  end

  def finish_date_cannot_be_in_the_past
    errors.add(:finish_on, "can't be in the past") if
    !finish_on.blank? and finish_on < Date.today
  end

  def can_be_accepted_by?(user)
   creator != user && state == 'Waiting for challenger'
  end
end
