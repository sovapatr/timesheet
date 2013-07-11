class Equipment < ActiveRecord::Base
  has_many :equipment_entries
  has_many :jobs, through: :equipment_entries
  attr_accessible :equip_num, :name, :rental
  
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Equipment.create! row.to_hash
    end
  end
end
