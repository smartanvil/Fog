as yet unclassified
call: aETHMessageSend
	| response |
	response := ZnEasy post: url data: (ZnEntity json: (self encode: aETHMessageSend)).
	self processResponse: response.
	^ self decode: response entity