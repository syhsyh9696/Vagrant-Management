class Experiment < ApplicationRecord
  has_one :judgement, :dependent => :destroy
end
