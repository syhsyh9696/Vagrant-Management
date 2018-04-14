class Experiment < ApplicationRecord
  has_one :judgement, :dependent => :destroy
  has_many :submissions

  has_and_belongs_to_many :users
end
