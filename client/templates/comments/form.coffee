Template.commentForm.events
	'click #newComment': (evt, tmpl) ->
		options = form2js 'comment-form'
		Meteor.call 'newComment', options, (err) ->
			($ tmpl.find '.reset').trigger 'click' unless err
		return false

Template.commentForm.rendered = ->
	($ '#content').focus()
