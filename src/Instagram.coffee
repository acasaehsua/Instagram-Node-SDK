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

		fetch: ( url, params, method ) ->
			data = 
				access_token: @token

			console.log params
			console.log method
			$.ajax(
				url: @api + url
				type: method || 'GET'
				data: $.extend data, params.data
				dataType: 'jsonp'
				success: (res) ->
					params.callback res
			)

		# apis
		#Current User#
		#params: @count, @min_id, @max_id
		getFeeds: (params) ->
			@fetch '/users/self/feed', params

		getLikes: (params) ->
			@fetch '/users/self/media/liked', params	
		
		getReqs: (callback) ->
			@fetch '/users/self/requested-by', {callback: callback}

		#User#
		getUser: (id, callback) ->
			@fetch '/users/' + id, {callback: callback}

		getPhotos: (params) ->
			@fetch '/users/' + params.id + '/media/recent', params	

		getFollows: (params) ->
			@fetch '/users/' + params.id + '/follows', params

		getFans: (params) ->
			@fetch '/users/' + params.id + '/followed-by', params

		getRelationship: (id, callback) ->
			@fetch '/users/' + id + '/relationship', {callback: callback}

		isPrivate: (id, callback) ->
			@getRelationship id, (res) ->
				callback res.data.target_user_is_private 

		isFollowing: (id, callback) ->
			@getRelationship id, (res) ->
				callback res.data.outgoing_status == 'follows'

		isFollowedBy: (id, callback) ->
			@getRelationship id, (res) ->
				callback res.data.incoming_status != 'none'

		editRelationship: (id, params, method) ->
			@fetch '/users/' + id + '/relationship', params, method

		follow: (id, callback) ->
			@editRelationship id, {callback: callback, data: {action: 'follow'} }, 'POST'

		unfollow: (id, callback) ->
			@editRelationship id, {callback: callback, data: {action: 'unfollow'} }, 'POST'

		block: (id, callback) ->
			@editRelationship id, {callback: callback, data: {action: 'block'} }, 'POST'

		unblock: (id, callback) ->
			@editRelationship id, {callback: callback, data: {action: 'unblock'} }, 'POST'

		approve: (id, callback) ->
			@editRelationship id, {callback: callback, data: {action: 'approve'} }, 'POST'

		deny: (id, callback) ->
			@editRelationship id, {callback: callback, data: {action: 'deny'} }, 'POST'

		searchUser: (params) ->
			@fetch '/users/search', params

		#media#
		getPhoto: (id, callback) ->
			@fetch '/media/' + id, {callback: callback}

		searchPhoto: (params) ->
			@fetch '/media/search', params
		
		getPopular: (callback) ->
			@fetch '/media/popular', {callback: callback}

		#comment#
		getPhotoComments: (id, callback) ->
			@fetch '/media/' + id + '/comments', {callback: callback}

		postComment: (params) ->
			@fetch '/media/' + params.id + '/comments', params.data, 'POST'

		deleteComment: (id, callback) ->
			@fetch '/media/' + id + '/comments', {callback: callback}, 'DELETE'

		#like#
		getPhotoLikes: (id, callback) ->
			@fetch '/media/' + id + '/likes', {callback: callback}

		postLike: (id, callback) ->
			@fetch '/media/' + id + '/likes', {callback: callback}, 'POST'

		deleteLike: (id, callback) ->
			@fetch '/media/' + id + '/likes', {callback: callback}, 'DELETE'

		#tags#
		getTag: (tagName, callback) ->
			@fetch '/tags/' + tagName, {callback: callback}

		getRecentTags: (params) ->
			@fetch '/tags/' + params.id + '/media/recent', params.data

		searchTag: (q, callback) ->
			@fetch '/tags/search', {callback: callback}

		#location#
		getLoc: (locId, callback) ->
			@fetch '/locations/' + locId, {callback: callback}

		getRecentLoc: (params) ->
			@fetch '/locations/' + params.id + '/media/recent', params.data

		searchLoc: (q, callback) ->
			@fetch '/locations/search', {callback: callback}

		#geographies#
		getNearby: (id, callback) ->
			@fetch '/geographies/' + id + '/media/recent', {callback: callback}

	exports.Instagram = Instagram

) jQuery, window