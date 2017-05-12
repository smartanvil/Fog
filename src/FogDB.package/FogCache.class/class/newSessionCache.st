instance creation
newSessionCache
	^ self current newSubCache: self new. 