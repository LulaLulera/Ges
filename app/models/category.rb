class Category < ApplicationRecord
	belongs_to :user, :optional => true
	validates :name, presence: true, uniqueness: true #obliga a que cada categoria tenga un nombre único
	has_and_belongs_to_many :alumns
	#relacionamos category - hasCategory - Alumn, para llegar de alumn hay que hacerlo through has_categories
end
