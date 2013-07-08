class Equipment < ActiveRecord::Base
  has_many :equipment_entries
  has_many :jobs, through: :equipment_entries
  attr_accessible :equip_num, :name, :rental
end
