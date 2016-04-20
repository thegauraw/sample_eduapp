class Progress < ActiveRecord::Base
  belongs_to :student
  attr_accessible :lesson, :part
end
