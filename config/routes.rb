Rails.application.routes.draw do
  # Routes for the Debate resource:
  # CREATE
  get "/debates/new", :controller => "debates", :action => "new"
  post "/create_debate", :controller => "debates", :action => "create"

  # READ
  get "/debates", :controller => "debates", :action => "index"
  get "/debates/:id", :controller => "debates", :action => "show"

  # UPDATE
  get "/debates/:id/edit", :controller => "debates", :action => "edit"
  post "/update_debate/:id", :controller => "debates", :action => "update"

  # DELETE
  get "/delete_debate/:id", :controller => "debates", :action => "destroy"
  #------------------------------

  # Routes for the Election resource:
  # CREATE
  get "/elections/new", :controller => "elections", :action => "new"
  post "/create_election", :controller => "elections", :action => "create"

  # READ
  get "/elections", :controller => "elections", :action => "index"
  get "/elections/:id", :controller => "elections", :action => "show"

  # UPDATE
  get "/elections/:id/edit", :controller => "elections", :action => "edit"
  post "/update_election/:id", :controller => "elections", :action => "update"

  # DELETE
  get "/delete_election/:id", :controller => "elections", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
