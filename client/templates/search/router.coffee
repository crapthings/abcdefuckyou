Router.map ->
	@route 'search',
		path: '/search/:keyword'
		data: ->
			searchPostsList: Posts.find {},
				sort:
					timestamp: -1
		waitOn: ->
			return [ Meteor.subscribe('searchPostsList', @params.keyword) ]
