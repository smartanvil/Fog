accessing
timestamp: anObject 
	timestamp := DateAndTime fromUnixTime: (anObject asBKNumber)
	