# 
# This is an unofficial javascript sdk for instagram sdk.
# 
# Author: Bryant Chan
# 
# Contact: bryantandk@gmail.com (@bryantandk)
# 
# 2012-12-08

( ($, exports) ->

	class Instagram

		constructor: ( options ) -> 

			@endPoint = 'https://instagram.com/oauth/authorize/?'
			params = ''
			$.each options, (key, value) ->
				params += (key + '=' + value + '&')

			@authUri = @endPoint + params

		auth: ->	
			window.location.href = @authUri
			
		getToken: ->
			return window.location.hash.replace '#access_token=', ''

		fetch: (url, params) ->

		test: (o) ->
			console.log o

	exports.Instagram = Instagram

) jQuery, window