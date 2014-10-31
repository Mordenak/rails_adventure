class Character < ActiveRecord::Base
  belongs_to :race
  belongs_to :pc_class
  belongs_to :user
end
