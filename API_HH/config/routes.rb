Rails.application.routes.draw do
  resources :resorts, :only => [:index, :show]    # REST-запросы-
  post "/graphql", to: "graphql#execute"
  get '/graphql', to: 'graphql#execute'
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #
  scope module: 'api' do
    namespace :v1 do
      resources :jobs
      resources :companies do
        # var.1 - :company_id
        match 'mark_deleted', to: 'companies/mark_deleted', via: :put
        resources :jobs
      end
      # var.2 - :id
      match '/:id/mark_deleted', to: 'companies#mark_deleted', via: :put
    end
  end

  match "*path", to: "application#catch_404", via: :all



end
