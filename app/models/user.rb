class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable, :lockable,
         :recoverable, :rememberable, :trackable, :validatable

  WEDDING_PARTY_ACCESS = 5

  def in_wedding_party?
    WEDDING_PARTY_ACCESS <= access_level
  end
end
