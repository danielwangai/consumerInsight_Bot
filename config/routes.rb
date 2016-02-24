Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  post 'incoming' => 'telegram#incoming', as: 'incoming'
end
