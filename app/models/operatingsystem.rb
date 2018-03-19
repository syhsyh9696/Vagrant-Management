class Operatingsystem < ApplicationRecord
  has_many :vagrantfiles, :dependent => :destroy

end
