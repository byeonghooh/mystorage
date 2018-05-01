Rails.application.routes.draw do
  root 'posts#index' #root로 controller 연결되어 있어서 지워도 됨(URL 에 /index 없어도 됨)

  get 'posts/new' => 'posts#new' 

  get 'posts/edit/:id' => 'posts#edit'
  
  post "posts/update/:id" => "posts#update"
  
  get "posts/destroy/:id" => "posts#destroy" # 요청 해주세요!
  
  get 'posts/index' => 'posts#index'

  get 'posts/show/:id' => 'posts#show'  # show라는 인덱스를 show로 연결함(컨트롤러#)

  post 'posts/create' => 'posts#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
