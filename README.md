#JS SDK FOR INSTAGRAM APIs
This simple sdk is written in [CoffeeScript] for front-end developers to build applications with instagram apis easily. `The script is based on jquery`

##Usage


Integrate sdk with your application

```javascript
<script src="jquery.js"></script>
<script src="instagram.min.js"></script>

```

create a new instance of Instagram object

```javascript
var IG = new Instagram();
```

Handle authorize
```javascript

var param = {
    client_id: YOUR_CLIENT_ID,
    redirect_uri: YOUR_REDIRECT_URI,
    scope: YOUR_SCOPE,
    response_type: 'token'
}

IG.auth( param ); //then will go to the authorize page

//handle the callback token
var token = IG.getToken();

//you need to set token before you use it
IG.setToken( token );

//you code...
```

##API LIST 
`Params is object of params that customize the request defined by instagram apis`  
`Basic params: count, max_id, min_id`  

`Search`  
 - searchUser(callback, [params](http://instagram.com/developer/endpoints/users/#get_users_search))  
 - searchPhoto(callback, [params](http://instagram.com/developer/endpoints/media/#get_media_search))  
 - searchTag(callback, [params](http://instagram.com/developer/endpoints/tags/#get_tags_search))  
 - searchLocation(callback, [params](http://instagram.com/developer/endpoints/locations/#get_locations_search))  

`Current user`  
 - getFeeds(callback, [params](http://instagram.com/developer/endpoints/users/#get_users_feed))  
 - getLikes(callback, [params](http://instagram.com/developer/endpoints/users/#get_users_feed_liked))  
 - getReqs(callback) 

`User`  
 - getUser(uid, callback)  
 - getPhotos(uid, callback, [params](http://instagram.com/developer/endpoints/users/#get_users_media_recent))  
 - getFollowing(uid, callback)  
 - getFans(uid, callback)  
 
`Relationship`  
 - getRelationship(uid, callback)  
 - isPrivate(uid, callback)  
 - isFollowing(uid, callback)  
 - isFollowedBy(uid, callback)  
 - follow(uid, callback)  
 - unfollow(uid, callback)  
 - block(uid, callback)  
 - unblock(uid, callback)  
 - approve(uid, callback)  
 - deny(uid, callback)  
 

`Media`  
 - getPhoto(pid, callback, params)  
 - getPopular(callback, params)  

`Comments`  
 - getComments(pid, callback, params)  
 - postComment(pid, callback, [params](http://instagram.com/developer/endpoints/comments/#post_media_comments))  
 - deleteComment(pid, callback)  
 
`Likes`  
 - getLikes(pid, callback, params)  
 - addLike(pid, callback)  
 - deleteLike(pid, callback)  

`Tags`  
 - getTag(tagName, callback, params)  
 - getRecentTags(tagName, callback, [params](http://instagram.com/developer/endpoints/tags/#get_tags_media_recent))  
 
`Locations`  
 - getLocation(locId, callback, params)  
 - getRecentLocations(locId, callback, [params](http://instagram.com/developer/endpoints/locations/#get_locations_media_recent))  

`Geography`
    - getNearBy(geoId, callback, [params](http://instagram.com/developer/endpoints/geographies/#get_geographies_media_recent))
```
[CoffeeScript]: http://coffeescript.org/