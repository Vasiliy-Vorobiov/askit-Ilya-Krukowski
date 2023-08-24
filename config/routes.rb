Rails.application.routes.draw do
  get 'pages/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # Корневой маршрут, кторорый обращается к контроллеру pages
  # и вызывать там метод index
  root 'pages#index'
end
