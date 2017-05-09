building names
generationName
	^ name ifNil: [ name := '' join: (('_' split: description name) collect: #capitalized) ]