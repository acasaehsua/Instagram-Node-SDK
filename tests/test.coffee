( ($, require) ->

	Instagram = require.Instagram
	test = new Instagram (
		client_id: 'a6a557833e75443ab06c9250e47b5524'
		redirect_uri: 'http://localhost/xampp/projects/Instagram-JS-SDK/'
		scrope: 'basic+comments+relationships+likes'
		response_type: 'token'
	)

	$('button').click ->
		test.auth()

) jQuery, window