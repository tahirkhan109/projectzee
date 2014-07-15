class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  has_many :roles_users, :dependent => :destroy
  has_many :roles, :through => :roles_users
  has_many :conferences

  def admin?
    roles.include?(Role.find_by_title("admin"))
  end
  def programmer?
    roles.include?(Role.find_by_title("programmer"))
  end
  def attendee?
    roles.include?(Role.find_by_title("attendee"))
  end

end
