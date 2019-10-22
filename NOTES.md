RESTful routing

index     get '/posts'            has a list of all the posts with links to the detail pages (show pages)
show      get '/posts/:id'        has detailed content for a single post (matching the :id parameter) and 
                                  also a delete button for deleting it.
new       get '/posts/new'        has form to create new post
create    post '/posts'           handles form submission and redirects to another route (either posts   
                                  index or the newly created post's show page)
edit      get '/posts/:id/edit'   has form to edit an existing post
update    patch '/posts/:id'      handles form submission and redirects to another route (either posts  
          put '/posts/:id'        index or the updated post's show page)
destroy   delete '/posts/:id'     handles form submission to delete a post and redirects to another route

nested routes

index     get '/posts/:post_id/comments'
show      get '/posts/:post_id/comments/:id'
new       get '/posts/:post_id/comments/new'
create    post '/posts/:post_id/comments'
edit      get '/posts/:post_id/comments/:id/edit'
update    patch '/posts/:post