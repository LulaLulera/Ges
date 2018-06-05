class CreateAlumns < ActiveRecord::Migration[5.1]
  def change
    create_table :alumns do |t|
      t.string :nombre
      t.string :apellido1

      t.timestamps
    end
  end
end
