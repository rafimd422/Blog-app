class ApplicationController < ActionController::Base
def index
  @blog_posts = BlogPost.all
end
end
