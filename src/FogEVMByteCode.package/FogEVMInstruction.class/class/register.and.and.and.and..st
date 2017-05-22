as yet unclassified
register: aCodeOp and: aMnemoic and: stackPops and: stackPushes and: aDescription
	| class |
	class := self createSubclassFor: aMnemoic.
	class comment: aDescription.
	{(self stackPushesClassMethod: stackPushes).
	(self stackPopsClassMethod: stackPops).
	(self codeOpClassMethod: aCodeOp).
	(self mnemonicClassMethod: aMnemoic)} do: [ :m | class class compile: m classified: 'generated' ]