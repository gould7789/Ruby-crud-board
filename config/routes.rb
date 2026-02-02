Rails.application.routes.draw do
  # 게시판의 기본 기능(목록 보기, 글 쓰기, 글 저장, 글 읽기, 수정 폼, 수정하기, 삭제하기)
  # 를 이 한 줄로 레일즈가 자동으로 주소와 연결 고리를 만들어줌
  resources :posts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")

  # 이 코드가 없으면 localhost:3000/posts까지 적어야함, 있다면 posts까지는 필요없음
  root "posts#index"
end
