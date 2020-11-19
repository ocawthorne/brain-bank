class PostController < AppController
   get(':username/posts') {erb :'users/posts'}

   get "/feed" do
      @user = User.find(session[:id])
      erb :'users/feed'
   end

   get "/:username/posts" do
      @user = User.find_by(username: params[:username])
      erb :"users/posts"
   end

   post '/new' do
      params[:is_public] = params[:is_public] == "on" ? "t" : "f"
      Post.create(
         content: params[:content],
         date_added: Time.new,
         is_public: params[:is_public],
         votes: 0,
         user_id: current_user.id
      )
      redirect "/#{User.find(session[:id]).username}/posts"
   end

   get '/:username/posts/edit/:post_id' do
      if session[:id] == User.find_by(username: params[:username]).id
         @content = Post.find(params[:post_id]).content
         erb :'posts/edit'
      else
         erb :'sessions/failure'
      end
   end

   post '/:username/posts/edit/:post_id' do
      Post.find(params[:post_id]).update(
         content: params[:content],
         is_public: params[:is_public]
      )
      redirect "/#{User.find(session[:id]).username}/posts"
   end

   get '/:username/posts/delete/:post_id' do
      post = Post.find(params[:post_id])
      user = User.find_by(username: params[:username])
      if post.user_id == user.id
         Post.find(params[:post_id]).delete
         redirect "/#{params[:username]}/posts"
      else
         erb :'sessions/failure'
      end
   end

end
