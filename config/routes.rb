MobileVideoUpload::Application.routes.draw do

  root to: 'videos#index'

  resources :videos do
    collection do
      post :upload_started
      post :upload_completed
    end
  end

end
