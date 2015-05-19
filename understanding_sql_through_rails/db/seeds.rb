user = User.create({name: 'Joe'})
post = Post.create({title: 'Post', content: 'Something', user_id: user.id})
Category.create({name: 'Cat1', post_ids: [post.id]})
