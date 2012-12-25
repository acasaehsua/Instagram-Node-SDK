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
			client_id: '32226e2c48af49b38109d816616a5369'
			client_secret: '19e9e271a1a74ebfaba8916816aba461'
			redirect_uri: 'http://localhost/xampp/projects/Instagram-JS-SDK/examples'
			scope: 'comments+relationships+likes'
			response_type: 'token'
		ig.auth param


	ig.setOptions
		token: store.get 'ig_token'

	# 237062958
	$('button').click ->
		ig.follow '237062958', (res) ->
			console.log res


) jQuery, window