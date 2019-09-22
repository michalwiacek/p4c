Rails.application.routes.draw do
  namespace :api, :path => "", :defaults => {:format => :json} do
    namespace :v1 do
      resources :verticals
      resources :categories
      resources :courses
    end
  end
end
