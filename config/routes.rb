Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'application#index'
  get 'most_relevants' => 'application#most_relevants'
  get 'most_mentions' => 'application#most_mentions'
end
