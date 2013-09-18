Template.searchbar.events
	'keypress .search': (evt, tmpl) ->
		if evt.keyCode is 13 and ($ evt.target).val().length > 1
			Router.go '/search/' + ($ evt.target).val()
			# ($ tmpl.find '.reset').trigger 'click'
			return false
