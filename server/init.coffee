Meteor.startup ->

	isSystemExist = System.findOne { config: true }

	unless isSystemExist

		options =
			config: true
			stats:
				pageviews: 0
				posts: 0
				comments: 0

		System.insert options
