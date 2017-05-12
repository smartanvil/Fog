tests
assertIsASessionProxy: anObject
	| objectClass |
	objectClass := MirrorPrimitives classOf: anObject.
	^ self assert: (objectClass = AvForwardingProxy or: [ objectClass = AvDelegationProxy ])