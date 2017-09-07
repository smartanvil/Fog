as yet unclassified
mirror
	^ mirror ifNil: [ mirror := self resolveMirror ]