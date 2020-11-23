class PostController < AppController
   get(':username/posts') {erb :'users/posts'}

   get "/feed" do
      @user = User.find(session[:id])
      erb :'posts/feed'
   end

   get "/:username/posts" do
      @user = User.find_by(username: params[:username])
      erb :'users/posts'
   end

   post '/new' do
      params[:is_public] = params[:is_public] == "on" ? "t" : "f"
      @user = User.find(session[:id])
      if !params["post"]["content"].empty?
         @user.posts << Post.create(
            content: params["post"]["content"],
            date_added: Time.new,
            is_public: params["post"]["is_public"],
            votes: 0,
            user_id: current_user.id
         )
      end
      redirect "/#{User.find(session[:id]).username}/posts"
   end

   get('/:username/posts/new') {erb :'users/home'}

   get '/:username/posts/edit/:post_id' do
      post = Post.find(params[:post_id])
      @checked = post.is_public ? "checked" : ""
      if session[:id] == User.find_by(username: params[:username]).id
         @content = post.content
         erb :'posts/edit'
      else
         erb :'sessions/failure'
      end
   end

   post '/:username/posts/edit/:post_id' do
      Post.find(params[:post_id]).update(
         content: params["post"]["content"],
         is_public: params["post"]["is_public"]
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
