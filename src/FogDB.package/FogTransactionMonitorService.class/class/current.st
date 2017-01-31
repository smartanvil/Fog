as yet unclassified
current
	| monitors |
	monitors := Set new.
	current
		ifNotNil: [ current isRunning
				ifFalse: [ monitors addAll: current monitors.
					current kill.
					current := nil ] ].
	^ current
		ifNil: [ current := self new
				monitors: monitors;
				start;
				yourself ]