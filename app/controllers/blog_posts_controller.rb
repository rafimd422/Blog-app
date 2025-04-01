class BlogPostsController < ApplicationController
    # to show all blog post
    def index
      @blog_posts = BlogPost.all
    end

    # to show specific blog post
    def show
      @blog_post = BlogPost.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        redirect_to root_path, alert: "Blog post not found."
    end

    # to create new blogpost
    def new
      @blog_post = BlogPost.new
    end
end
