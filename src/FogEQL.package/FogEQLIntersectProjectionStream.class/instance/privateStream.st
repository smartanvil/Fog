accessing
privateStream
	^ privateStream
		ifNil: [ privateStream := (firstCollection reset upToEnd intersection: secondCollection reset upToEnd)
				readStream ]