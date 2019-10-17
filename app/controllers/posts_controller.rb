class PostsController < Sinatra::Base
  configure do 
    set :views, 'app/views'
  end
  # index
  get '/' do 
    redirect '/posts'
  end

  get '/posts' do 
    status 200
    @posts = Post.visible
    erb :"posts/index.html"
  end

  # new post
  get '/posts/new' do 
    erb :"posts/new.html"
  end

  # post show route
  get '/posts/:id' do 
    @post = Post.find(params[:id])
    @page_title = @post.title
    erb :"posts/show.html"
  end

  # create post 
  post '/posts' do 
    @post = Post.create(title: params[:title],content: params[:content])
    redirect "/posts/#{@post.id}"
  end

  # post edit route
  get '/posts/:id/edit' do 
    @post = Post.find(params[:id])
    @page_title = "Edit #{@post.title}"
    erb :"posts/edit.html"
  end

  # update post route
  patch '/posts/:id' do 
    @post = Post.find_by_id(params[:id])
    redirect "/posts" unless @post
    if @post.update(title: params[:title],content: params[:content])
      redirect "/posts/#{@post.id}"
    else 
      @error = "Post couldn't be saved because of the following errors: #{@post.errors.full_messages.to_sentence}"
      erb :"posts/edit.html"
    end
  end

  delete '/posts/:id' do 
    @post = Post.find_by_id(params[:id])
    redirect "/posts" unless @post
    @post.update(deleted: true)
    redirect "/posts"
  end

end