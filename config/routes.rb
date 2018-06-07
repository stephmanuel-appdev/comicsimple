Rails.application.routes.draw do
  # Routes for the Comic resource:
  # CREATE
  get "/comics/new", :controller => "comics", :action => "new"
  post "/create_comic", :controller => "comics", :action => "create"

  # READ
  get "/comics", :controller => "comics", :action => "index"
  get "/comics/:id", :controller => "comics", :action => "show"

  # UPDATE
  get "/comics/:id/edit", :controller => "comics", :action => "edit"
  post "/update_comic/:id", :controller => "comics", :action => "update"

  # DELETE
  get "/delete_comic/:id", :controller => "comics", :action => "destroy"
  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
