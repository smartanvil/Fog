as yet unclassified
wetToDryMessage: aMessage toTarget: anObject
	'WetToDry' logCr.
	aMessage selector logCr.
	aMessage selector = #applyOn:valueWithArguments:
		ifTrue: [ self haltOnce.
			(anObject respondsTo: #applyOn:valueWithArguments:)
				ifFalse: [ (anObject respondsTo: #applyOn:valueWithArguments:configuration:)
						ifTrue: [ " Rewriting message send for adding configuration, according to the session " aMessage setSelector: #applyOn:valueWithArguments:configuration: arguments: aMessage arguments , {(session messageConfigurationFor: anObject)} ] ] ]