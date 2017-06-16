accessing
wipeJumpsFrom: aMethod
	method := aMethod.
	aMethod accept: self.
	tags
		select: [ :t | 
			(jumps noneSatisfy: [ :j | j address literalValue asBKNumber = t address literalValue asBKNumber ])
				and: [ t ~= aMethod sequence statements first ] ]
		thenDo: [ :t | "method sequence removeStatement: t" ]