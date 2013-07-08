class Extra < ActiveRecord::Base
  has_many :job_extras
  has_many :job_costcodes
  has_many :jobs, through: :job_costcodes
  attr_accessible :code, :description, :job_id
    def code_description
    [code, description].join(' - ')
  end
end
