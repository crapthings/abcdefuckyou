Template.comboPostForm.events
	'click #newPost': (evt, tmpl) ->
		options =
			content: ($ '#content').val()
		console.log options.content
		Meteor.call 'newPost', options, (err) ->
			($ tmpl.find '.reset').trigger 'click' unless err
		return false

Template.comboPostForm.rendered = ->
	($ '#content').focus()
