visiting
visitVariable: aFogEVMAstVariable
	state = #writing
		ifTrue: [ (self readWriteTracker at: aFogEVMAstVariable) at: #lastAssignment put: assignationValue.
			(self readWriteTracker at: aFogEVMAstVariable) at: #write put: ((self readWriteTracker at: aFogEVMAstVariable) at: #write) + 1 ]
		ifFalse: [ (self readWriteTracker at: aFogEVMAstVariable) at: #read put: ((self readWriteTracker at: aFogEVMAstVariable) at: #read) + 1 ]