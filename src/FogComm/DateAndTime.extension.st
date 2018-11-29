Extension { #name : #DateAndTime }

{ #category : #'*FogComm' }
DateAndTime >> asDateAndHour [
	^ self class
		year: self year
		month: self monthName
		day: self dayOfMonth
		hour: self hour
		minute: 0
		second: 0
		nanoSecond: 0
		offset: self class localOffset
]
