class User < ActiveRecord::Base
  has_many :bets

  #
  # validates :email,
  #           presence: true,
  #           uniqueness: true,
  #           format: {
  #               message: 'domain must be selleo.com',
  #               with: /\A[\w+-.]+@selleo.com\z/i
  #           }

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
         user.name = auth['info']['name'] || ""
         user.email = auth['info']['email'] || ""
         user.image = auth['info']['image'] || ""
      end
    end
  end

  def update_profile_pic_if_newer(auth)
    self.image = auth['info']['image'] if self.image != auth['info']['image']
    self.save!
  end
end
