Template.layout.rendered = ->
	($ '.timeago').timeago()
	if ($ 'textarea').length
		($ 'textarea').autosize()
