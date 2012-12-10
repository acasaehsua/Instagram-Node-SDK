##curentUser
GET/users/self/feed                     See the authenticated user's feed.
GET/users/self/media/liked              See the authenticated user's list of liked media.
GET/users/self/requested-by             List the users who have requested to follow.

##user
GET/users/user-id                       Get basic information about a user.
GET/users/user-id/media/recent          Get the most recent media published by a user.
GET/users/user-id/follows               Get the list of users this user follows.
GET/users/user-id/followed-by           Get the list of users this user is followed by.
GET/users/user-id/relationship          Get information about a relationship to another user.
POST/users/user-id/relationship         Modify the relationship with target user.
GET/users/search                        Search for a user by name.

GET/media/media-id                      Get information about a media object.
GET/media/search                        Search for media in a given area.
GET/media/popular                       Get a list of currently popular media.

##comment
GET/media/media-id/comments             Get a full list of comments on a media.
POST/media/media-id/comments            Create a comment on a media. Please email apidevelopers[at]instagram.com for access.
DEL/media/media-id/comments/comment-id  Remove a comment.

##like
GET/media/media-id/likes                Get a list of users who have liked this media.
POST/media/media-id/likes               Set a like on this media by the current user.
DEL/media/media-id/likes                Remove a like on this media by the current user.

##tag
GET/tags/tag-name                       Get information about a tag object.
GET/tags/tag-name/media/recent          Get a list of recently tagged media.
GET/tags/search                         Search for tags by name.

##location
GET/locations/location-id               Get information about a location.
GET/locations/location-id/media/recent  Get a list of media objects from a given location.
GET/locations/search                    Search for a location by geographic coordinate.

##geographies
GET/geographies/geo-id/media/recent     Get recent media from a geography subscription.