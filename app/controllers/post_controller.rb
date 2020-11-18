class PostController < AppController
   get(':username/posts') {erb :'users/posts'}

   get "/feed" do
      erb :feed
   end

   get ":username/posts" do
      @user = User.find_by(username: params[:username])
      erb :"users/posts"
   end

end
