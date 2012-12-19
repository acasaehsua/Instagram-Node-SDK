( ($, require) ->

	Instagram = require.Instagram

	param = 
		client_id: '32226e2c48af49b38109d816616a5369'
		redirect_uri: 'http://localhost/xampp/projects/Instagram-JS-SDK/examples'
		scope: 'basic+comments+relationships+likes'
		response_type: 'token'

	ig = new Instagram()

	ig.setOptions
		client_id: '32226e2c48af49b38109d816616a5369'

	# 1047392
	$('button').click ->
		ig.isPrivate 5112145, (res) ->
			console.log res
) jQuery, window