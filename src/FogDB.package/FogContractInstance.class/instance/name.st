accessing
name
	^ name
		ifNil: [ String
				streamContents: [ :str | 
					str
						nextPutAll: ' contract instance ';
						nextPutAll: address ] ]