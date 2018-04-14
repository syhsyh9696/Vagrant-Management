class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :student

  has_many :submissions
  has_and_belongs_to_many :experiments

  def admin?
    return self.admin
  end

  def student?
    return false if self.stunum == nil
    return true if self.stunum != nil
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
