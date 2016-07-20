Rails.application.routes.draw do
  get '/:words', to: 'anagrams#index'
end
