# Version: 1.0 
#
# Description: This is an unofficial javascript sdk for instagram sdk.
# 
# Author: Bryant Chan
# 
# Contact: bryantandk@gmail.com (@bryantandk)
# 
# 2012-12-08

( ($, exports) ->

	class Instagram
		api: 'http://bonstu.com/projects/igsdk/ajax.php'

		endPoint: 'https://instagram.com/oauth/authorize/?'

		constructor: (  )-> 
			
		auth: ( options ) ->	
			params = ''
			$.each options, (key, value) ->
				params += (key + '=' + value + '&')

			@authUri = @endPoint + params
			window.location.href = @authUri

		getToken: ->
			return window.location.hash.replace '#access_token=', ''

		setOptions: (options) ->
			self = @
			$.each options, (key, value) ->
				self[key] = value

		fetch: ( url, callback, params, method ) ->
			data = {}
			if @token
				data['access_token'] = @token
			if @client_id
				data['client_id'] = @client_id

			ajaxData =
				url: @api
				type: 'POST'
				dataType: 'json'
				data: 
					method: method || 'GET'
					url: url
					params: $.extend {}, data, params
				success: (res) ->
					console.log res
					code = res.result.meta.code
					switch code
						when '200' then callback res.data
						when '400' then console.log
					callback res.result
			console.log ajaxData
			$.ajax ajaxData


		currentUser: (callback) ->
			@fetch '/users/self', callback

		#Current User#
		getFeeds: (callback, params) ->
			@fetch '/users/self/feed', callback, params

		getLikes: (callback, params) ->
			@fetch '/users/self/media/liked', callback, params	
		
		getReqs: (callback) ->
			@fetch '/users/self/requested-by', callback

		#User#
		getIdByName: (name, callback) -> 
			@searchUser name, (res) ->
				lists = res.data
				name = name.toLowerCase()
				obj = lists[0] if lists
				if obj and obj['username'] is name
					callback obj['id']
				else
					callback false
		getUser: (id, callback) ->
			@fetch '/users/' + id, callback

		getPhotos: (id, callback, params) ->
			@fetch '/users/' + id + '/media/recent', callback, params	

		getFollowing: (id, callback) ->
			@fetch '/users/' + id + '/follows', callback, params

		getFans: (id, callback) ->
			@fetch '/users/' + id + '/followed-by', callback, params

		getRelationship: (id, callback) ->
			@fetch '/users/' + id + '/relationship', callback

		isPrivate: (id, callback) ->
			@getUser id, (res) ->
				callback res.meta.error_message is 'you cannot view this resource' 

		isFollowing: (id, callback) ->
			@getRelationship id, (res) ->
				callback res.data.outgoing_status == 'follows'

		isFollowedBy: (id, callback) ->
			@getRelationship id, (res) ->
				callback res.data.incoming_status != 'none'

		editRelationship: (id, callback, action) ->
			@fetch '/users/' + id + '/relationship', callback, {action: action}, 'POST'

		follow: (id, callback) ->
			@editRelationship id, callback, 'follow'

		unfollow: (id, callback) ->
			@editRelationship id, callback, 'unfollow'

		block: (id, callback) ->
			@editRelationship id, callback, 'block'

		unblock: (id, callback) ->
			@editRelationship id, callback, 'unblock'

		approve: (id, callback) ->
			@editRelationship id, callback, 'approve'

		deny: (id, callback) ->
			@editRelationship id, callback, 'deny'

		searchUser: (q, callback) ->
			@fetch '/users/search?q=' + q, callback

		#media#
		getPhoto: (id, callback, params) ->
			@fetch '/media/' + id, callback, params

		searchPhoto: (callback, params) ->
			@fetch '/media/search', callback, params
		
		getPopular: (callback, params) ->
			@fetch '/media/popular', callback, params

		#comment#
		getComments: (id, callback, params) ->
			@fetch '/media/' + id + '/comments', callback, params

		postComment: (id, callback, params) ->
			@fetch '/media/' + id + '/comments',callback, params, 'POST'

		deleteComment: (id, callback) ->
			@fetch '/media/' + id + '/comments', callback, {}, 'DELETE'

		#like#
		getLikes: (id, callback, params) ->
			@fetch '/media/' + id + '/likes', callback, params

		addLike: (id, callback) ->
			@fetch '/media/' + id + '/likes', callback, {}, 'POST'

		deleteLike: (id, callback) ->
			@fetch '/media/' + id + '/likes', callback, {}, 'DELETE'

		#tags#
		getTag: (tagName, callback, params) ->
			@fetch '/tags/' + tagName, callback, params

		getRecentTags: (tagName, callback, params) ->
			@fetch '/tags/' + tagName + '/media/recent', callback, params

		searchTag: (callback, params) ->
			@fetch '/tags/search', callback, params
		#location#
		getLocation: (locId, callback, params) ->
			@fetch '/locations/' + locId, callback, params

		getRecentLocations: (locId, callback, params) ->
			@fetch '/locations/' + locId + '/media/recent', callback, params

		searchLocation: (callback, params) ->
			@fetch '/locations/search', callback, params

		#geographies#
		getNearby: (id, callback, params) ->
			@fetch '/geographies/' + id + '/media/recent', callback, params

	exports.Instagram = Instagram

) jQuery, window