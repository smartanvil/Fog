initialization
ensureMonitor
	| monitors |
	(monitor isNotNil and: [ monitor isRunning ])
		ifFalse: [ monitors := Set new.
			monitor
				ifNotNil: [ monitor isRunning
						ifFalse: [ monitors addAll: monitor monitors.
							monitor kill.
							monitor := nil ] ].
			monitor := FogTransactionMonitorService new
				monitors: monitors;
				session: self;
				start;
				yourself ].
	^ monitor