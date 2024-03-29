class PostsController < ApplicationController
  before_filter :authenticate_user!
  skip_before_filter :display_flash_notice, only: ["index"]
  expose_decorated(:posts)
  expose_decorated(:post)

  def index
    self.posts = Post.where archived: false
  end

  def new
  end

  def edit
  end

  def update
    if post.save
      render action: :index
    else
      render :new
    end
  end

  def destroy
    if post.user.eql? current_user
      post.destroy
    end
    render action: :index
  end

  def show
  end

  def mark_archived
    post.archived = true
    post.save
    render action: :show
  end

  def create
    if post.save
      redirect_to action: :index
    else
      render :new
    end
  end

end
