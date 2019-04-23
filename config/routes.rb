Rails.application.routes.draw do
  #devise_for :users
  scope '(:locale)', locale: /#{I18n.available_locales.map(&:to_s).join('|')}/, defaults: { locale: "en" } do
    root to: 'home#index'
    get "dashboard", to: 'dashboard#index'
    put "dashboard", to: "dashboard#update"
    devise_for :users, controllers: {
      passwords: "users/passwords",
      sessions: "users/sessions",
      registrations: "users/registrations",
      confirmations: "users/confirmations"
    }
    get "peds", to: 'peds#index'
    post "search_record", to: 'search_record#search'
    resources :search_record
  end
end
