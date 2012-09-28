# 
# This is an unofficial javascript sdk for instagram sdk.
# 
# Author: Bryant Chan
# 
# Contact: bryantandk@gmail.com (@bryantandk)
# 
#

k = (o)->
	if o
		console.log o
	else
		console.log 'testing'


class Instagram

	constructor: () -> 
		@clientId = 'a6a557833e75443ab06c9250e47b5524'
		@redirectUri = 'http://localhost/xampp/projects/Instagram-JS-SDK/'
		@tokenUri = 'https://instagram.com/oauth/authorize/?client_id='+@clientId+'&redirect_uri='+@redirectUri+'&response_type=token'
		@endPoint = 'https://api.instagram.com/v1/'
		@auth()

	auth: ->
		if window.location.hash
			@hash = window.location.hash.replace('#access_token=', '')
			store.set('instagram-token', @hash)

		if store.get('instagram-token') is undefined
			location.href = @tokenUri		

	fetch: (url, params) ->
		params['access_token'] = store.get 'instagram-token'

		$.ajax
			type: "GET"
			url: @endPoint + url
			dataType: 'jsonp'
			data: params
			success: (data) ->
				k data


test = new Instagram
# store.remove('instagram-token');
$('button').click ->
	test.fetch '/users/self/feed'
		count: 20

