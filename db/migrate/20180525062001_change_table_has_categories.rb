class ChangeTableHasCategories < ActiveRecord::Migration[5.1]
  def change	
  	drop_table :has_categories
	def change
    	create_join_table :has_categories do |t|
	      	t.index [:alumn_id, :category_id]
	      	t.index [:category_id,:alumn_id]
  		end
  	end
  end
end
