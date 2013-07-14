ActiveAdmin.register Entry do
  scope :unentered
  
  filter :job
  filter :employee_id
  filter :costcode
  filter :date
  filter :entered
  
  
  batch_action :enter do |selection|
      Entry.find(selection).each do |entry|
        entry.update_attributes(:entered => true)
      end
      redirect_to :back
    end
  
  index do
    selectable_column
    column :date
    column :job, sortable: 'jobs.job_num'
    column :employee, sortable: 'employees.last_name'
    column :costcode, sortable: 'costcodes.code'
    column :extra
    column "Regular Time", :time_r
    column "Overtime Time", :time_o
    default_actions
  end
    
  form do |f|
      
    f.inputs "Entry" do
      f.input :job
      f.input :date 
      f.input :costcode
      f.input :time_r, :label => "Regular Time"
      f.input :time_o, :label => "Overtime"
      f.input :entered
    end
    f.actions
    end
  
  show do |entry|
      attributes_table do
        row :employee
        row :job
        row :date
        row :costcode
        row :time_r
        row :time_o  
        row :entered
      end
      active_admin_comments
    end
  
  controller do
    def scoped_collection
      end_of_association_chain.includes(:employee, :costcode, :job)
    end
  end  
end
