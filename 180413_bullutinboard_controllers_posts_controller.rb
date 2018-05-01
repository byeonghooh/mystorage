class PostsController < ApplicationController
  def new 
  end

  def create
     @post = Post.new
     @post.title = params[:title]
     @post.content = params[:content]
     @post.save
     
     redirect_to "/posts/index"
  end
  
  def index
    @post = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit # get (받아옴)
     @post = Post.find(params[:id]) #Params : 대문자는 model, class로!
     
  end
  
  def update # post (보내기)
     @post = Post.find(params[:id]) # id 값 불러와서 업데이트함
     @post.title = params[:title]
     @post.content = params[:content]
     @post.save
     
     redirect_to :back
  end
  
  def destroy
     @post = Post.find(params[:id]) # id 값 불러와서 삭제함
     @post.destroy
     
     redirect_to '/posts/index' #처리하고, view 파일이 없어서 써줌
  end

end
