class Employee < ActiveRecord::Base
  has_many :entries
  has_many :jobs, through: :entries
  attr_accessible :first_name, :last_name, :entries_attributes
  accepts_nested_attributes_for :entries
  def full_name
    [first_name, last_name].join(' ')
  end
  
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Employee.create! row.to_hash
    end
  end
  
end
