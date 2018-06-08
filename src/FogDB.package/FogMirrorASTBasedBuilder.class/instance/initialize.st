initialization
initialize
	super initialize.
	self deprecated: 'Shouldnt use this class'.
	types := Dictionary new.
	variableSlots := OrderedCollection new.
	contractSlots := OrderedCollection new.
	methods := OrderedCollection new