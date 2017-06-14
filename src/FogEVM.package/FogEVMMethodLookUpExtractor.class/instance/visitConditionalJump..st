visiting
visitConditionalJump: aFogEVMAstConditionalJump
	(finished not and: [ aFogEVMAstConditionalJump condition receiver isEVMLiteral ])
		ifTrue: [ lookUpTable
				at: aFogEVMAstConditionalJump condition receiver
				put:
					{(#address -> aFogEVMAstConditionalJump address).
					(#startNode -> nil).
					(#endNode -> nil)} asDictionary ]