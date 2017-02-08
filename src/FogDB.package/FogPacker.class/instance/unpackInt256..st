as yet unclassified
unpackInt256: aString 
	self flag: #CheckSigns.
	^ aString asBKNumber 