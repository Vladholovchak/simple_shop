Rails.application.routes.draw do
  use_doorkeeper
  devise_for :users
  scope module: :api, defaults: { format: :json }, path: 'api'  do
    scope module: :v1, constraints: ApiVersion.new('v1', true) do
      devise_for :users, controllers: {
          registrations: 'api/v1/users/registrations',
      }, skip: [:sessions, :password]
    end
  end
end
