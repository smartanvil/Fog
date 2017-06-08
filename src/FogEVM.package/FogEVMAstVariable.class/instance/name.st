accessing
name
	^ (name ifNil: [ name := self class generateName ]) copyReplaceAll: 'TVar' with: 'CONST'