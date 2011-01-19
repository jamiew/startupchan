Bboard::Application.routes.draw do

  resources :entries

  devise_for :users do
    get "/login"    => "devise/sessions#new", :as => 'login'
    get "/signup"   => "devise/registrations#new", :as => 'signup'
    get "/logout"   => "devise/sessions#destroy", :as => 'logout'
    get "/settings" => "users#edit", :as => 'settings'
  end

  # get "/forum" => "forums#show", :id => 1
  resources :forums do
    resources :forum_threads do
      resources :forum_posts
    end
  end

  # Search -- forums only for now
  get '/search' => 'forums#search'

  # Dupes to make existing tests pass... FIXME
  resources :forum_threads
  resources :forum_posts do
    get :sticky, :on => :member, :via => [:put]
  end

  controller :home do
    get '/about', :action => 'about', :as => 'about'
    get '/privacy', :action => 'privacy', :as => 'privacy'
    get '/tos', :action => 'tos', :as => 'tos'
  end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  root :to => "forums#show", :id => 1, :as => 'main_forum'

end
