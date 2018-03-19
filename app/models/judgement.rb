class Judgement < ApplicationRecord
  # 不绑定可以变换对应的experiment
  belongs_to :experiment # 绑定之后不能轻易删除

end
