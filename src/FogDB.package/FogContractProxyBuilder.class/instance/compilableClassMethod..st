building methods
compilableClassMethod: aFogMethodMirror
	| variables |
	variables := '{' , (' . ' join: aFogMethodMirror parameters variables) , '}'.
	^ '{1}
	| instance |
	instance := (self mirror method: #{2}) applyOn: self contractDescription valueWithArguments: {3} from: self session sessionAccount.
	^ self forInstance: (bind waitIsReady; yourself) at: #latest.
'
		format:
			{aFogMethodMirror selectorWithNames.
			aFogMethodMirror selector.
			variables}