( ($, require) ->

	Instagram = require.Instagram

	store = 
		get: (key) ->
			return window.localStorage.getItem(key)
		set: (key, val) ->
			return window.localStorage.setItem(key, val)
		clear: ->
			return window.localStorage.clear()
		remove: (key) ->
			return window.localStorage.removeItem(key)

	ig = new Instagram()

	if window.location.hash
		token = ig.getToken()
		store.set 'ig_token', token

	if not store.get 'ig_token'
		param = 
			client_id: '86be0f75fa034c38adfba93d660f2a80'
			redirect_uri: 'http://localhost/xampp/projects/Instagram-JS-SDK/examples'
			scope: 'basic+comments+relationships+likes'
			response_type: 'token'
		ig.auth param


	ig.setOptions
		token: store.get 'ig_token'

	# 237062958
	$('button').click ->
		ig.follow 237062958, (res) ->
			console.log res


) jQuery, window