Rails.application.routes.draw do
  # get 'questions/index' - сгенерировано по умолчанию
  # localhost:3000/questions HTTP GET
  # app/views/questions/index.html.erb
  get '/questions', to: 'questions#index'

  # get 'pages/index' - сгенерировано по умолчанию
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # Корневой маршрут, кторорый обращается к контроллеру pages
  # и вызывать там метод index
  root 'pages#index'
end
