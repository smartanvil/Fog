initialization
setUp
	super setUp.
	stream := FogDBTimestampIntervalBlockStream new.
	fromStamp := '2016-05-23T20:00:02+02:00' asDateAndTime.
	toStamp := '2016-05-23T20:30:02+02:00' asDateAndTime.
	stream between: fromStamp and: toStamp