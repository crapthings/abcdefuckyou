@Comments = new Meteor.Collection 'comments'

Comments.before.insert (userId, comment) ->
	comment.createdAt = new Date()
	comment.timestamp = Date.now()

Comments.after.insert (userId, comment) ->
	Posts.update comment.postId,
		$inc:
			'stats.comments': 1

Meteor.methods

	newComment: (options) ->
		if options and options.content and options.content.length > 5 and options.content.length < 421
			Comments.insert options

if Meteor.isServer

	Meteor.publish 'latestCommentsList', ->
		Comments.find {},
			sort:
				timestamp: -1
