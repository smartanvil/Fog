"
Contract account. Related with a contract object (EVM bytecode ). 
"
Class {
	#name : #FogContractInstance,
	#superclass : #FogAccount,
	#instVars : [
		'code',
		'abi',
		'contract'
	],
	#category : 'FogLive-Domain'
}

{ #category : #'as yet unclassified' }
FogContractInstance class >> kindOfAccount [
	^ 'Contract'
]

{ #category : #accessing }
FogContractInstance >> binaryHash [
	^ contract binaryHash
]

{ #category : #accessing }
FogContractInstance >> contract [
	<doc: 'Returns the account''s contract description. This object represents the MetaType of a Contract'>
	^ contract
]

{ #category : #accessing }
FogContractInstance >> contract: aContractDescription [
	contract := aContractDescription.
]

{ #category : #testing }
FogContractInstance >> isContract [
	<doc:
		'A contract account is a contract. This method returns always true in this subclass'>
	^ true
]

{ #category : #testing }
FogContractInstance >> isReady [
	^ address isNotNil
]

{ #category : #accessing }
FogContractInstance >> mirror [
	<doc: 'Returns the contract''s instance mirror'>
	^ contract mirror instanceMirror
]

{ #category : #accessing }
FogContractInstance >> name [
	^ name
		ifNil: [ String
				streamContents: [ :str | 
					str
						nextPutAll: ' contract instance ';
						nextPutAll: address ] ]
]

{ #category : #printing }
FogContractInstance >> printOn: aStream [
	^ ('Contract ', self name) printOn: aStream
]

{ #category : #accessing }
FogContractInstance >> proxy [
	<doc:
		'Returns a proxy object to the contract at the current #latest state. '>
	^ contract contract forInstance: self
]

{ #category : #accessing }
FogContractInstance >> proxyAt: aBlockTagNumberOrHash [
<doc:
		'Returns a proxy object to the contract at the a given state (blockhash -tag - number).'>
	^ contract contract forInstance: self at: aBlockTagNumberOrHash
]

{ #category : #syncing }
FogContractInstance >> waitIsReady [
	| secondsToWait |
	secondsToWait := 60.
	[ address isNil and: [ secondsToWait > 0 ] ]
		whileTrue: [ secondsToWait := secondsToWait - 1.
			1 second wait ].
	address ifNil: [ self error: 'timeout!' ]
]
