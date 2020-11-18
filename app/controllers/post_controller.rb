class PostController < AppController
   get(':username/posts') {erb :'users/posts'}
end
