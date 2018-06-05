class Alumn < ApplicationRecord
	belongs_to :user
	has_and_belongs_to_many :categories
  has_many :comments, dependent: :delete_all
	validates :nombre, presence: true
	validates :apellido1, presence: true

	#after_create :save_categories  #callback del modelo
  #after_update :save_categories  #callback del modelo

	has_attached_file :cover, styles: { medium: "1280x720", thumb: "100x100>" }  #tiene un archivo adjunto que se llama cover
  validates_attachment_content_type :cover, :content_type => /\Aimage\/.*\Z/

  	

  	#custom setter, le asignamos valor al atributo (se ve por el =)
  	# def categories=(value)
  	# 	@categories = value
  	# end
    def self.main_columns
    %i(
       id
       nombre
       apellido1
       apellido2
       mother_phone
       father_phone
       direccion
       alergias
       )
    end
    
    def self.to_csv
      attributes = %w{Identificador Nombre Apellido Apellido Teléfono(madre) Teléfono(padre) Dirección Alergias}
       CSV.generate(col_sep:';', encoding:'ISO-8859-1') do |csv|
         csv << attributes
          all.each do |alumn|
            csv << self.main_columns.map{ |attr| alumn.send(attr) }
          end
      end
  end
  
	private
	#Es el callback, guarda las categorias. Crea registros de la tabla has categories, asignamos el campo de la categoria y el del alumno
  	# def save_categories
   #    unless @categories.blank?
  	# 	  @categories.each do|category_id|
  	# 		 HasCategory.create(category_id: category_id,alumn_id: self.id)
  	# 	  end
   #    end
  	# end
end
