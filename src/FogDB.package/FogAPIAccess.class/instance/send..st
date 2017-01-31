as yet unclassified
send: aMessage
	| response |
	response := connection call: aMessage.
	self processResponse: response.
	
	^ response at: #result