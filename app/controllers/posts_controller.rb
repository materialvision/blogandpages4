class PostsController < ApplicationController
  before_filter :login_required, :except => [:index, :show, :tagged, :rss]
  before_filter :tagcloud
  layout "application", :except => :rss

  def index
    @posts = Post.all.paginate(page: params[:page], per_page: 15).order("created_at DESC")
  end

  def show
    @post = Post.find(params[:id])
  end

  def tagged
    @posts=Post.tagged_with(params[:tagg]).paginate(:page => params[:page], :per_page => 8)
    render :action => 'index'
  end

  def rss
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "Successfully created post."
      redirect_to calculate_importance_path
    else
      render :action => 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:notice] = "Successfully updated post."
      redirect_to @post
    else
      render :action => 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Successfully destroyed post."
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :author, :tag_list)
  end
end
