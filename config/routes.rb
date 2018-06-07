Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  root :to => "comics#index"
  # Routes for the Medium resource:
  # CREATE
  get "/media/new", :controller => "media", :action => "new"
  post "/create_medium", :controller => "media", :action => "create"

  # READ
  get "/media", :controller => "media", :action => "index"
  get "/media/:id", :controller => "media", :action => "show"

  # UPDATE
  get "/media/:id/edit", :controller => "media", :action => "edit"
  post "/update_medium/:id", :controller => "media", :action => "update"

  # DELETE
  get "/delete_medium/:id", :controller => "media", :action => "destroy"
  #------------------------------

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
