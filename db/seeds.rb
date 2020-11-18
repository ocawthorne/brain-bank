Post.create(
   title:      "Title 1",
   content:    "Content 1",
   date_added: Time.new,
   is_public:  1,
   votes:      0,
   user_id:    1
)

Post.create(
   title:      "Title 2",
   content:    "Content 2",
   date_added: Time.new,
   is_public:  1,
   votes:      0,
   user_id:    2
)

Post.create(
   title:      "Title 3",
   content:    "Content 3",
   date_added: Time.new,
   is_public:  1,
   votes:      0,
   user_id:    3
)

Post.create(
   title:      "Title 4",
   content:    "Content 4",
   date_added: Time.new,
   is_public:  0,
   votes:      0,
   user_id:    1
)

Post.create(
   title:      "Title 5",
   content:    "Content 5",
   date_added: Time.new,
   is_public:  0,
   votes:      0,
   user_id:    2
)

Post.create(
   title:      "Title 6",
   content:    "Content 6",
   date_added: Time.new,
   is_public:  0,
   votes:      0,
   user_id:    3
)

Follower.create(
   user_id_followed:  1,
   user_id_following: 2
)

Follower.create(
   user_id_followed:  1,
   user_id_following: 3
)

Follower.create(
   user_id_followed:  2,
   user_id_following: 3
)

User.create(
   name:      "Oliver",
   username:  "ocawthorne",
   email:     "ocawt@fake.com",
   password:  "password",
   reputation: 0
)

User.create(
   name:      "John",
   username:  "johnnie123",
   email:     "jj@fake.com",
   password:  "password",
   reputation: 0
)

User.create(
   name:      "Mark",
   username:  "marko",
   email:     "mark@fake.com",
   password:  "password",
   reputation: 0
)
