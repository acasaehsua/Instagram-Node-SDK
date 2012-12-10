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
var IG = new Instagram(  );
```

Handle authorize
```javascript

var param = {
    client_id: YOUR_CLIENT_ID,
    redirect_uri: YOUR_REDIRECT_URI,
    scope: YOUR_SCOPE,
    response_type: 'token'
}

IG.auth(  param  ); //then will go to the authorize page

//handle the fn token
var token = IG.getToken(  );

//you need to set token before you use it
IG.setToken(  token  );

//you code...
```

##API LIST 
`Params is object of params that customize the request defined by instagram apis`  
`Basic params: count, max_id, min_id`  

`Search`  
 - searchUser( fn, [params]( http://instagram.com/developer/endpoints/users/#get_users_search ) )  
 - searchPhoto( fn, [params]( http://instagram.com/developer/endpoints/media/#get_media_search ) )  
 - searchTag( fn, [params]( http://instagram.com/developer/endpoints/tags/#get_tags_search ) )  
 - searchLocation( fn, [params]( http://instagram.com/developer/endpoints/locations/#get_locations_search ) )  

`Current user`  
 - getFeeds( fn, [params]( http://instagram.com/developer/endpoints/users/#get_users_feed ) )  
 - getLikes( fn, [params]( http://instagram.com/developer/endpoints/users/#get_users_feed_liked ) )  
 - getReqs( fn ) 

`User`  
 - getUser( uid, fn )  
 - getPhotos( uid, fn, [params]( http://instagram.com/developer/endpoints/users/#get_users_media_recent ) )  
 - getFollowing( uid, fn )  
 - getFans( uid, fn )  
 
`Relationship`  
 - getRelationship( uid, fn )  
 - isPrivate( uid, fn )  
 - isFollowing( uid, fn )  
 - isFollowedBy( uid, fn )  
 - follow( uid, fn )  
 - unfollow( uid, fn )  
 - block( uid, fn )  
 - unblock( uid, fn )  
 - approve( uid, fn )  
 - deny( uid, fn )  
 

`Media`  
 - getPhoto( pid, fn, params )  
 - getPopular( fn, params )  

`Comments`  
 - getComments( pid, fn, params )  
 - postComment( pid, fn, [params]( http://instagram.com/developer/endpoints/comments/#post_media_comments ) )  
 - deleteComment( pid, fn )  
 
`Likes`  
 - getLikes( pid, fn, params )  
 - addLike( pid, fn )  
 - deleteLike( pid, fn )  

`Tags`  
 - getTag( tagName, fn, params )  
 - getRecentTags( tagName, fn, [params]( http://instagram.com/developer/endpoints/tags/#get_tags_media_recent ) )  
 
`Locations`  
 - getLocation( locId, fn, params )  
 - getRecentLocations( locId, fn, [params]( http://instagram.com/developer/endpoints/locations/#get_locations_media_recent ) )  

`Geography`
    - getNearBy( geoId, fn, [params]( http://instagram.com/developer/endpoints/geographies/#get_geographies_media_recent ) )
```
[CoffeeScript]: http://coffeescript.org/