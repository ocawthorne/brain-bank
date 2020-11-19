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

   get '/:username/posts/edit/:post_id' do
      erb :'posts/edit'
   end

   post '/:username/posts/edit/:post_id' do

   end

   get '/:username/posts/delete/:post_id' do
      post = Post.all.find(params[:post_id])
      user = User.all.find_by(username: params[:username])
      if post.user_id == user.id
         post.delete
         Post.save
      else

      end
   end

end
