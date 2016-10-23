Rails.application.routes.draw do
  get 'scrap/index' => 'scrap#index', as: 'scrap'
  get 'scrap/all_links' => 'scrap#all_links', as: 'all_links'
  root 'scrap#welcome'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
