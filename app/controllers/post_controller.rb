class PostController < AppController
   get(':username/posts') {erb :'users/posts'}

   get "/feed" do
      erb :feed
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
   end

end
