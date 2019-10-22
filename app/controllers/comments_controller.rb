class CommentsController < Sinatra::Base 
  post '/posts/:post_id/comments' do 
    @post = Post.find_by_id(params[:post_id])
    if @post 
      @post.comments.create(title: params[:title], content: params[:content])
      redirect "/posts/#{@post.id}"
    else
      # later we might add a flash message to say Post not found
      redirect "/posts"
    end
  end
end