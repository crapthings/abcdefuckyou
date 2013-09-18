Router.map ->
	@route 'home',
		path: '/'
		data: ->
			latestPostsList: Posts.find {},
				sort:
					timestamp: -1
		waitOn: ->
			return [ Meteor.subscribe('latestPostsList') ]
		after:
			Meteor.call 'pv1'
