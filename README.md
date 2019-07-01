# SimpleCommunication
Kickstart app for simple communication between iOS and WatchOS

### On the IOS side, what function is used to receive messages from the watch?

The overloaded **session** method with _didReceiveMessage_ of type String and _replyHandler_ of type function parameters derived from _WCSessionDelegate_ is used.

### When receiving messages from the watch, you need to use a closure function. What is the reason why a closure is used?

The above mention overloaded **session** method with _didReceiveMessage_ of type String with clouser funcition parameter _replyHandler_ is used. The reason is _replyHandler_ clouser function gives ability to consume its implementation from the place where it is used. In this case it is implemented where the _sendMessage_ method is called (iWatch app) and consumed inside implementation of overloaded **session** method with _didReceiveMessage_ parameter (iOS app).

