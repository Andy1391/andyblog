class User < ApplicationRecord
  ROLES = %i[admin moderator guest]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy

  # validates :name, presence: true 

  after_create :ensure_login_has_a_value

  private
    def ensure_login_has_a_value
      if current_user.name.nil?
        self.user.name = user.email
      end
    end

end
