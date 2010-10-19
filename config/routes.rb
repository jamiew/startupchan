Youbeweed::Application.routes.draw do

  devise_for :users

  resources :forums do
    resources :forum_threads do
      resources :forum_posts
    end
  end

  # Dupes for tests...
  resources :forum_threads
  resources :forum_posts

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  root :to => "forums#index"

end
