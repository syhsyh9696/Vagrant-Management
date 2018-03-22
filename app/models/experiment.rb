class Experiment < ApplicationRecord
  has_one :judgement, :dependent => :destroy
  has_many :submissions
end
