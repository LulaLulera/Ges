Rails.application.routes.draw do
  
  resources :categories
  resources :alumns do
    
    resources :comments
  end
  devise_for :users

  get 'show_list'=> "alumns#show_list",:as => "show_list"
  get 'show_timetable'=> "alumns#show_timetable",:as => "show_timetable"
  get 'show_resources'=> "alumns#show_resources",:as => "show_resources"


  get 'show_list_category'=> "categories#show_list_category",:as => "show_list_category"
  get 'show_menu'=> "categories#show_menu",:as => "show_menu"
  get 'show_timetable_comedor'=> "categories#show_timetable_comedor",:as => "show_timetable_comedor"
  get 'show_timetable_madrugadores'=> "categories#show_timetable_madrugadores",:as => "show_madrugadores"
  get 'show_timetable_tardones'=> "categories#show_timetable_tardones",:as => "show_timetable_tardones"
  get 'activities'=> "categories#activities",:as => "activities"
  get 'activities_tardones'=> "categories#activities_tardones",:as => "activities_tardones"
  get 'docs'=> "categories#docs",:as => "docs"

  #Esto es similar a escribir:
	  #get "/alumns" index
	  #post "/alumns" create
	  #delete "/alumns" delete
	  #get "/alumns/:id" show
	  #get "/alumns/new" new
	  #get "/alumns/:id/edit" edit
	  #patch "/alumns/:id" update
	  #put "/alumns/:id" update
  #
  #
  #
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
