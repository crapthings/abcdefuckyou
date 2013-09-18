@Posts = new Meteor.Collection 'posts'

Posts.before.insert (userId, post) ->
	post.createdAt = new Date()
	post.timestamp = Date.now()
	post.stats =
		comments: 0
		pageviews: 0

Posts.after.insert (userId, post) ->
	System.update { config: true },
		$inc:
			'stats.posts': 1

Posts.after.remove (userId, post) ->
	System.update { config: true },
		$inc:
			'stats.posts': -1

Meteor.methods

	newPost: (options) ->
		if options and options.content and options.content.length > 5 and options.content.length < 421
			options.content = options.content.trim()
			isPostExist = Posts.find { content: options.content }
			if isPostExist.count()
				Posts.remove { content: options.content }
			Posts.insert options

	clean: (options) ->
		Posts.remove { content: { $regex: options, $options: 'i' } }

	postpv1: (postId) ->
		Posts.update postId,
			$inc:
				'stats.pageviews': 1

if Meteor.isServer

	Meteor.publish 'latestPostsList', ->
		Posts.find {},
			sort:
				timestamp: -1
			limit: 200

	Meteor.publish 'post', (postId) ->
		Posts.find { _id: postId }

	Meteor.publish 'searchPostsList', (keyword) ->
		Posts.find { content: { $regex: keyword, $options: 'i' } },
			sort:
				timestamp: 1
			limit: 200
