class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :student

  def admin?
    return self.admin
  end

  def author_name; self.display_name; end

  def display_name
    if self.username.present?
      self.username
    else
      self.email.split("@").first
    end
  end

end
