class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable, :lockable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :first_name, :last_name

  enum access_level: {default: 0, wedding_party: 5, admin: 10}
  WEDDING_PARTY_ACCESS = 5

  def in_wedding_party?
    wedding_party? || admin?
  end
end
