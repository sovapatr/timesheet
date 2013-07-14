class Costcode < ActiveRecord::Base
  has_many :job_costcodes, :dependent => :destroy
  has_many :jobs, through: :entries, select: 'distinct jobs.*'
  has_many :extras, through: :job_costcodes
  has_many :entries
  has_many :equipment_entries
  attr_accessible :code, :description, :job_id
  alias_attribute :name, :code
  def code_description
    [code, description].join(' - ')
  end
  
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Costcode.create! row.to_hash
    end
end
  
end
