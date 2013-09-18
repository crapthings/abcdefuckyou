Template.loading.rendered = ->
	($ '#loading').center().css('display', 'block')
	options =
		color: '#666'
		lines: 3
		length: 0
		width: 10
		radius: 12
		corners: 1
		speed: 1
		trail: 50
		top: -50
	new Spinner(options).spin(@find '#spin')
