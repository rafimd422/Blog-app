class BlogPostsController < ApplicationController
    # to show all blog post
    def index
      @blog_posts = BlogPost.all # Fetch all blog posts from the database
    end

    # to show specific blog post
    def show
      @blog_post = BlogPost.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        redirect_to root_path, alert: "Blog post not found."
    end

    # to create new blogpost
    def new
      @blog_post = BlogPost.new # Initialize a new BlogPost object
    end

    def edit
      @blog_post = BlogPost.find(params[:id])
    end

    def update
      @blog_post = BlogPost.find(params[:id])
      if @blog_post.update(blog_post_params)
        redirect_to @blog_post # Redirect to the show page of the updated blog post
      else
        render :edit # Render the edit template again if there are errors
      end
    end

    def create
      @blog_post = BlogPost.new(blog_post_params)
      if @blog_post.save
        redirect_to @blog_post # Redirect to the show page of the newly created blog post
      else
        render :new # Render the new template again if there are errors
      end
    end

 private
    def blog_post_params
      params.require(:blog_post).permit(:title, :body)
    end
end
