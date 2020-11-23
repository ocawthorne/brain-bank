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
      redirect "/#{@user.username}/posts"
   end

   get('/:username/posts/new') {erb :'users/home'}

   get '/:username/posts/:post_id/edit' do
      post = Post.find(params[:post_id])
      @checked = post.is_public ? "checked" : ""
      is_user? ? (@content = post.content ; erb :'posts/edit') : (erb :'sessions/failure')
   end

   patch '/:username/posts/:post_id/edit' do
      if posts_user_id_matches_user_found_by_username && is_user?
         Post.find(params[:post_id]).update(content: params["post"]["content"], is_public: params["post"]["is_public"])
         params["post"]["content"] == "" ? (redirect "/#{current_user.username}/posts/#{params[:post_id]}/delete") : (redirect "/#{current_user.username}/posts")
      else
         erb :'sessions/failure'
      end
   end

   get '/:username/posts/:post_id/delete' do
      if posts_user_id_matches_user_found_by_username && is_user?
         Post.find(params[:post_id]).delete
         redirect "/#{params[:username]}/posts"
      else
         erb :'sessions/failure'
      end
   end

end
