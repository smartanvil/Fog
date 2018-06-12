running
setUp
	super setUp.
	connection := FogConnection on: self url.
	session := connection nonCachedSession .