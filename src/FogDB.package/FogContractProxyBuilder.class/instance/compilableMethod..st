building methods
compilableMethod: aFogMethodMirror
	| variables |
	variables := '{' , (' . ' join: aFogMethodMirror parameters variables) , '}'.
	^ '{1}
	| method |
	method := (self mirror method: #{2}).
	(method isStateModifier and: [ self blockReference ~= #latest ]) ifTrue: [ 
		^ self error:''the current proxy is pointing to an existing block. Only non-transactional methods can be executed''. 
	].

	^ method using: self session applyOn: self instance at: self blockReference valueWithArguments: {3} from: self session sessionAddress.
'
		format:
			{aFogMethodMirror selectorWithNames.
			aFogMethodMirror selector.
			variables}