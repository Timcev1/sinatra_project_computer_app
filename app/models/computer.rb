class Computer < ActiveRecord::Base
  has_many :graphic
  has_many :processor
end
