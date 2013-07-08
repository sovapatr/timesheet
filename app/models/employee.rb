class Employee < ActiveRecord::Base
  has_many :entries
  has_many :jobs, through: :entries
  attr_accessible :first_name, :last_name
  def full_name
    [first_name, last_name].join(' ')
  end
  
end
