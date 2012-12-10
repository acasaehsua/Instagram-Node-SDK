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
		api: 'https://api.instagram.com/v1'

		endPoint: 'https://instagram.com/oauth/authorize/?'

		constructor: -> 

		auth: ( options ) ->	
			params = ''
			$.each options, (key, value) ->
				params += (key + '=' + value + '&')

			@authUri = @endPoint + params
			window.location.href = @authUri

		getToken: ->
			return window.location.hash.replace '#access_token=', ''

		setToken: (token) ->
			@token = token

		fetch: ( url, callback, params, method ) ->
			data = 
				access_token: @token
			$.ajax(
				url: @api + url
				type: method || 'GET'
				data: $.extend data, params || {}
				dataType: 'jsonp'
				success: (res) ->
					callback res
			)

		#Current User#
		getFeeds: (callback, params) ->
			@fetch '/users/self/feed', callback, params

		getLikes: (callback, params) ->
			@fetch '/users/self/media/liked', callback, params	
		
		getReqs: (callback, params) ->
			@fetch '/users/self/requested-by', callback

		#User#
		getUser: (id, callback) ->
			@fetch '/users/' + id, callback

		getPhotos: (id, callback, params) ->
			@fetch '/users/' + id + '/media/recent', callback, params	

		getFollowing: (id, callback, params) ->
			@fetch '/users/' + id + '/follows', callback, params

		getFans: (id, callback, params) ->
			@fetch '/users/' + id + '/followed-by', callback, params

		getRelationship: (id, callback) ->
			@fetch '/users/' + id + '/relationship', callback

		isPrivate: (id, callback) ->
			@getRelationship id, (res) ->
				callback res.data.target_user_is_private 

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

		searchUser: (callback, params) ->
			@fetch '/users/search', callback, params

		#media#
		getPhoto: (id, callback, params) ->
			@fetch '/media/' + id, callback, params

		searchPhoto: (callback, params) ->
			@fetch '/media/search', callback, params
		
		getPopular: (callback, params) ->
			@fetch '/media/popular', callback, params

		#comment#
		getPhotoComments: (id, callback, params) ->
			@fetch '/media/' + id + '/comments', callback, params

		postComment: (id, callback, params) ->
			@fetch '/media/' + id + '/comments',callback, params, 'POST'

		deleteComment: (id, callback) ->
			@fetch '/media/' + id + '/comments', callback, {}, 'DELETE'

		#like#
		getPhotoLikes: (id, callback, params) ->
			@fetch '/media/' + id + '/likes', callback, params

		postLike: (id, callback) ->
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
		getLoc: (locId, callback, params) ->
			@fetch '/locations/' + locId, callback, params

		getRecentLoc: (locId, callback, params) ->
			@fetch '/locations/' + locId + '/media/recent', callback, params

		searchLoc: (callback, locId, callback, params) ->
			@fetch '/locations/search', callback, params

		#geographies#
		getNearby: (id, callback, params) ->
			@fetch '/geographies/' + id + '/media/recent', callback, params

	exports.Instagram = Instagram

) jQuery, window