Bboard::Application.routes.draw do

  resources :entries

  devise_for :users do
    get "/login"    => "devise/sessions#new", :as => 'login'
    get "/signup"   => "devise/registrations#new", :as => 'signup'
    get "/logout"   => "devise/sessions#destroy", :as => 'logout'
    get "/settings" => "users#edit", :as => 'settings'
  end

  get "/" => "forums#show", :id => 1, :as => 'main_forum'
  redirect '/forum' => '/'
  resources :forums, :except => [:edit, :update, :destroy] do
    get '/search' => 'forums#search'
  end

  # Ghetto shallow-nesting
  resources :forum_threads, :path => 'threads', :except => [:index, :edit, :update, :destroy]
  resources :forum_posts, :path => 'posts', :except => [:index, :show, :edit, :update, :destroy] do
    get :sticky, :on => :member, :via => [:put]
  end

  controller :home do
    get '/about', :action => 'about', :as => 'about'
    get '/privacy', :action => 'privacy', :as => 'privacy'
    get '/tos', :action => 'tos', :as => 'tos'
  end

  root :to => "forums#show", :id => 1

end
