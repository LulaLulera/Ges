class AddColumnsToAlumns < ActiveRecord::Migration[5.1]
  def change
    add_column :alumns, :apellido2, :string
    add_column :alumns, :mother_phone, :string
    add_column :alumns, :father_phone, :string
    add_column :alumns, :email, :string
    add_column :alumns, :direccion, :string
    add_column :alumns, :alergias, :string
  end
end
