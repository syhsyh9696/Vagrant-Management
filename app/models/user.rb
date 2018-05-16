class User < ApplicationRecord
  acts_as_token_authenticatable

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
  def name; self.author_name; end

  def display_name
    if self.username.present?
      self.username
    else
      self.email.split("@").first
    end
  end

  def follow_experiment(experiment_id)
    self.experiments << Experiment.find(experiment_id) unless self.experiments.include?(Experiment.find(experiment_id))
  end

  def unfollow_experiment(experiment_id)
    self.experiments.delete(Experiment.find(experiment_id)) if self.experiments.include?(Experiment.find(experiment_id))
  end

  def following?(other_experiment)
    self.experiments.include?(other_experiment)
  end
end
