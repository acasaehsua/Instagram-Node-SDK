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
There are three patterns for the method params
```javascript
//1.no params, only callback function e.g. :

IG.getReqs(function(res){
    //handle the result
})

//2. only 1 param e.g. : 
IG.getUser(12345, function(res){
    //handle the result
})

//3. more than 1 params
IG.getPhotos({
    id: 12345, //user id
    data: {}, //params that customize the request, defeined by instgram apis
    callback: (res){
        //your callback function
    }
})
```

[CoffeeScript]: http://coffeescript.org/