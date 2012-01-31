class CreateVacancies < ActiveRecord::Migration
  def change
    create_table :vacancies do |t|
      t.string :title
      t.string :external_vacancy_number
      t.string :location
      t.string :postcode
      t.integer :user_id
      t.integer :company_id

      t.timestamps
    end
  end
end
