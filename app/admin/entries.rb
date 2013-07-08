ActiveAdmin.register Entry do
  scope :unentered
  
  filter :job_id, collection: Hash[Job.all.map{|b| [b.job_num,b.id]}], as: :select
  filter :employee_id
  filter :date
  filter :entered
  
  batch_action :enter do |selection|
      Entry.find(selection).each do |entry|
        entry.update_attributes(:entered => true)
      end
      redirect_to :back
    end
  batch_action :destroy, false
  
  index do
    column :date
    column :employee_id do |employee|
      Employee.find(employee.employee_id).full_name
    end
    column :costcode_id do |costcode|
      Costcode.find(costcode.costcode_id).code
    end
    column :extra_id
    column "Regular Time", :time_r
    column "Overtime Time", :time_o      
  end
    
  form do |f|
      
    f.inputs "Entry" do
      f.input :job_id, :as => :select,      :collection => Hash[Job.all.map{|b| [b.job_num,b.id]}]
      f.input :date 
      f.input :costcode_id, :as => :select,      :collection => Hash[Costcode.all.map{|b| [b.code,b.id]}]
      f.input :time_r, :label => "Regular Time"
      f.input :time_o, :label => "Overtime"
      f.input :entered
    end
    f.actions
    end
  
  show do |entry|
      attributes_table do
        row :employee
        row :job_id do
          link_to Job.find(entry.job_id).job_num, admin_job_path(entry.job_id)
        end
        row :date
        row :costcode_id do
          link_to Costcode.find(entry.costcode_id).code, admin_job_path(entry.costcode_id)
        end
        row :time_r
        row :time_o  
        row :entered
      end
      active_admin_comments
    end
end
