Router.map ->
	@route 'comments',
		path: '/c/:_id'
		data: ->
			post: Posts.findOne @params._id
			latestCommentsList: Comments.find { postId: @params._id },
				sort:
					timestamp: -1
		waitOn: ->
			return [ Meteor.subscribe('post', @params._id ), Meteor.subscribe('latestCommentsList', @params._id) ]
		after: ->
			Meteor.call 'postpv1', @params._id
