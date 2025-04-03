class BlogPostsController < ApplicationController
    # to show all blog post
    def index
      @blog_posts = BlogPost.all # Fetch all blog posts from the database
    end

    # to show specific blog post
    def show
      if user_signed_in?
        @blog_post = BlogPost.new # Initialize a new BlogPost object
      else
          redirect_to root_path, alert: "You have to login First"
      end
      rescue ActiveRecord::RecordNotFound
        redirect_to root_path, alert: "Blog post not found."
    end

    # to create new blogpost
    def new
      if user_signed_in?
      @blog_post = BlogPost.new # Initialize a new BlogPost object
      else
        redirect_to root_path
      end
    end
    def edit
      if user_signed_in?
        @blog_post = BlogPost.new # Initialize a new BlogPost object
      else
          redirect_to root_path
      end
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

    def destroy
      @blog_post = BlogPost.find(params[:id])
      @blog_post.destroy # Delete the blog post from the database
      redirect_to root_path # Redirect to the index page after deletion
    end

 private
    def blog_post_params
      params.require(:blog_post).permit(:title, :body)
    end
end
