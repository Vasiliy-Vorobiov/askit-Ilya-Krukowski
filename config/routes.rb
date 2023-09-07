Rails.application.routes.draw do
  # get 'questions/index' - сгенерировано по умолчанию
  # localhost:3000/questions HTTP GET
  # app/views/questions/index.html.erb

  # resources :questions, only: %i[index new edit create update destroy show]
  # сегенерированы все методы
  resources :questions do
    # resources :answers, only: %i[create destroy]
    resources :answers, except: %i[create destroy]
  end

  # get '/questions', to: 'questions#index'

  # get 'pages/index' - сгенерировано по умолчанию
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # get '/question/new', to: 'questions#new'

  # post '/questions', to: 'questions#create'

  # get '/question/:id/edit', to: 'questions#edit'

  # get '/question/:id/show', to: 'questions#show'

  # Defines the root path route ("/")
  # Корневой маршрут, кторорый обращается к контроллеру pages
  # и вызывать там метод index
  root 'pages#index'
end
