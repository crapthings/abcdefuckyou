@System = new Meteor.Collection 'system'

Meteor.methods

	pv1: ->
		System.update { config: true },
			$inc:
				'stats.pageviews': 1

if Meteor.isServer

	Meteor.publish '', ->
		System.find { config: true }
