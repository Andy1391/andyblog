class User < ApplicationRecord
  ROLES = %i[admin moderator guest]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts

  def admin?
  end

  def moderator?
  end

  def guest?
  end

end
