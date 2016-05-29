class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable, :lockable,
         :recoverable, :rememberable, :trackable, :validatable

  enum access_level: {default: 0, wedding_party: 5, admin: 10}
  WEDDING_PARTY_ACCESS = 5

  def in_wedding_party?
    wedding_party? || admin?
  end
end
