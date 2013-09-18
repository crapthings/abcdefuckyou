@App = {}

@isLoggedIn = ->
	return true if Meteor.userId()

@isOwner = (creatorId) ->
	return true if isLoggedIn() and Meteor.userId() is creatorId

if Meteor.isClient

	# App

	App.logout = ->
		Meteor.logout (err) ->
			Router.go '/' unless err

	# Helper

	@Helper = Handlebars.registerHelper

	Helper 'checkRadio', (key, value) ->
		return 'checked' if @[key] is value

	Helper 'isRole', (userRole, role) ->
		return true if userRole is role

	Helper 'isOwner', (userId, creatorId) ->
		return true if userId is creatorId

	Helper 'prettyDate', (date) ->
		return moment(date).format 'YYYY.M.D'

	Helper 'timeago', (date) ->
		return moment(date).format()

	Helper 'search', ->
		return Session.get 'search'

	Helper 'system', ->
		return System.findOne { config: true }
