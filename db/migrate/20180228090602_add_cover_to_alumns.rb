class AddCoverToAlumns < ActiveRecord::Migration[5.1]
  def change
  	add_attachment :alumns, :cover 
  end
end
