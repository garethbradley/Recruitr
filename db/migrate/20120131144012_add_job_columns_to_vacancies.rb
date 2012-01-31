class AddJobColumnsToVacancies < ActiveRecord::Migration
  def change
    add_column :vacancies, :job_description, :text
    add_column :vacancies, :job_application_process, :text
    add_column :vacancies, :job_notes, :text
    add_column :vacancies, :job_contact_information, :text
    add_column :vacancies, :job_reports_to, :string
    add_column :vacancies, :job_benefits, :text
    add_column :vacancies, :job_qualifications, :text
    add_column :vacancies, :job_required_experience, :text
    add_column :vacancies, :job_sector_id, :integer
    add_column :vacancies, :job_type_id, :integer
    add_column :vacancies, :salary_min, :float
    add_column :vacancies, :salary_max, :float
    add_column :vacancies, :salary_ote, :float
    add_column :vacancies, :salary_bonus, :float
    add_column :vacancies, :fees, :float
  end
end

