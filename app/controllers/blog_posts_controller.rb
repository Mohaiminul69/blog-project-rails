class BlogPostsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_blog_post, except: [:index, :new, :create] # only: [:show, :edit :update :destroy]

    def index
        @posts = BlogPost.all
    end

    def show
    end

    def new
        @post = BlogPost.new
    end
    
    def create
        @post = BlogPost.new(post_params)
        if @post.save
            redirect_to @post, notice: "Post was successfully created."
        else
            p @post.errors.full_messages
            render :new, status: :unprocessable_entity
        end
    end

    def edit
    end

    def update
        if @post.update(post_params)
            redirect_to @post, notice: "Post was updated successfully"
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @post.destroy
        redirect_to root_path
    end
      
    private

    def set_blog_post
        @post = BlogPost.find(params[:id])
    rescue ActiveRecord::RecordNotFound
        redirect_to root_path
    end
    
    def post_params
        params.require(:blog_post).permit(:title, :body)
    end
end
  