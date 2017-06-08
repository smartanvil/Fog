as yet unclassified
cleanOneReadOneWriteVariables
	| modifications wiper |
	modifications := true.
	[ modifications ]
		whileTrue: [ wiper := FogEVMAstVariableWiperVisitor new.
			scopes keys asSortedCollection
				do: [ :k | (scopes at: k) accept: wiper ].
			wiper wipe.
			modifications := wiper anyScopeHasChanged ].
	wiper := FogEVMAstVariableWiperVisitor new.
	scopes keys asSortedCollection
		do: [ :k | (scopes at: k) accept: wiper ].
	wiper wipe.
	wiper := FogEVMAstVariableWiperVisitor new.
	scopes keys asSortedCollection
		do: [ :k | (scopes at: k) accept: wiper ].
	wiper wipe