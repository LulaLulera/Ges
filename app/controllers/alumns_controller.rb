class AlumnsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_alumn, except: [:index, :new, :create, :show_list, :show_timetable, :show_resources]

	def index
		
	end

	def show
		@comment= Comment.new		
	end

	def new
		@alumn= Alumn.new
		@categories = Category.all
	end

	def edit
		
	end

	def create
		if @alumn.save
			redirect_to @alumn
		else
			render :new
		end
	end

	def destroy
	 #DELETE FROM articles
    	@alumn = Alumn.find(params[:id])
    	@alumn.destroy # Destroy eliminar el objeto de la BD
    	redirect_to show_list_path
	end

	def update
		#@alumn.categories = params[:categories]
		
		if @alumn.update(alumn_params)
			redirect_to @alumn
		else
			render :edit
		end
	end

	def show_timetable

	end

	def show_resources

	end

	def show_list
		@alumns= Alumn.all

		respond_to do |format|
      		format.html
      		format.csv { send_data @alumns.to_csv, filename: "alumns-#{Date.today}.csv" }
   		end
	end

	

	private #Métodos privados del controlador 
	def set_alumn
		@alumn= Alumn.find(params[:id])
	end

	def validate_user
		redirect_to new_user_session_path, notice: "Es necesario iniciar sesión para continuar"
	end

	def alumn_params #aqui ponemos los datos que el usuario puede escribir, lo que sean sensibles no se ponene aqui
		params
		.require(:alumn)
		.permit(
			:nombre,
			:apellido1,
			:apellido2,
			:mother_phone,
			:father_phone,
			:direccion,
			:alergias,
			:cover, 
			:categories,
			:category_ids=>[])
	end	
end

