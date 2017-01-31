as yet unclassified
token: aToken
	token := aToken ifNil: [ false ] ifNotNil: [ aToken = 'true' ].
	self haltIf: [ ({nil . 'true' . 'false'} includes: aToken) not ].
	self flag: #whatsAToken