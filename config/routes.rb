Rails.application.routes.draw do
get "blog_post/:id", to: "blog_posts#show"

root "blog_posts#index"
end
