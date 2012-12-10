( ($, require) ->

	Instagram = require.Instagram

	param = 
		client_id: '32226e2c48af49b38109d816616a5369'
		redirect_uri: 'http://localhost/xampp/projects/Instagram-JS-SDK/examples'
		scrope: 'basic+comments+relationships+likes'
		response_type: 'token'

	ig = new Instagram()

	if window.location.hash
		ig.setToken ig.getToken()

	# 1047392
	$('button').click ->
		ig.getPopular (res) ->
			console.log res
) jQuery, window