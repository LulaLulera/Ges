class CreateTableHasCategories < ActiveRecord::Migration[5.1]
	def change
	    create_table :alumns_categories, :id => false do |t|
		     t.integer :alumn_id
		     t.integer :category_id
	  	end
	end
end