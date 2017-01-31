converting
assertEntityFromMessage: aMessage equalsToJson: aString
	| entity expected |
	entity := connection transferEntityFromMessage: aMessage.
	entity := self transferEntityFromJsonString: (NeoJSONWriter toString: entity).
	expected := self transferEntityFromJsonString: aString.
	self assert: entity equals: expected