##Instagram APIs

###Authentication  

  - Step One: Direct your user to the authorizatio [URL]  
  - Step Two: Receive the access_token via the URL fragment  
  
###Scope(Permissions)  

  - basic: to ready any data
  - comments: to create or delete comments
  - relationships: to follow or unfollow
  - likes: to like and unlike
  
###Real time

####Subscriptions  
	
- Users
- Tags  
- Locations
- Geographies	

###Endpoints

`https://api.instagram.com/v1/media/popular?access_token=TOKEN`

- APIS
	- users
		- user-id
			- media - recent
   		- self
   			- feed
   			- media - liked
   		- search 
      
      
      
      
      
      
      
[URL]: https://instagram.com/oauth/authorize/?client_id=CLIENT-ID&redirect_uri=REDIRECT-URI&response_type=token