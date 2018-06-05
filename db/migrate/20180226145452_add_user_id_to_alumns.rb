class AddUserIdToAlumns < ActiveRecord::Migration[5.1]
  def change
    add_reference :alumns, :user, foreign_key: true
    add_foreign_key :alumns, :users
  end
end
