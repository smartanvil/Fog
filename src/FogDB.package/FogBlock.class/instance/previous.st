accessing
previous
"self haltIf: [ ('2016-05-23T19:51:02+02:00' asDateAndTime - self timestamp) abs < 10 days ]."
	^ self connection findBlockByNumber: self number - 1 full: true