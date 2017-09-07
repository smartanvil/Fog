building methods
compilableInstanceMethods
	^ description mirror instanceMirror methods collect: [ :m | self compilableMethod: m ]