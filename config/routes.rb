Rails.application.routes.draw do
  post 'incoming' => 'telegram#incoming', as: 'incoming'
end
