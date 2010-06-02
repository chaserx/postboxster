class PostsController < ApplicationController
  require 'digest/sha1'
  
  before_filter :authenticate, :only => [:destroy, :update, :edit, :index]
  
  def index
    @posts = Post.all
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(params[:post])
    #@post.picture_content_type = MIME::Types.type_for(@post.picture_file_name).to_s
    if @post.save
      flash[:notice] = "Successfully created post."
      redirect_to @post
    else
      render :action => 'new'
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Successfully destroyed post."
    redirect_to posts_url
  end
  
  def update
    @post = Post.find(params[:id])
    #@post.picture_content_type = MIME::Types.type_for(@post.picture_file_name).to_s
    if @post.update_attributes(params[:post])
      flash[:notice] = "Successfully updated post."
      redirect_to @post
    else
      render :action => 'edit'
    end
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  private

    def authenticate
      authenticate_or_request_with_http_basic do |username, password|
        username == PASSWORDS_CONFIG[:username] &&
        Digest::SHA1.hexdigest(password) == PASSWORDS_CONFIG[:password]
      end
    end
  end
  
end
