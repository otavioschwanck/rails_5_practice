class CreatePatients < ActiveRecord::Migration[5.2]
  def change
    create_table :patients do |t|
      t.string :name
      t.date :birth_day
      t.text :description

      t.timestamps
    end
  end
end
