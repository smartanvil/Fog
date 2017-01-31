as yet unclassified
fetchAmmount: anInteger
	| blocks |
	blocks := OrderedCollection new.
	blocks add: (self connection eth getBlockByTag: 'latest' full: true).
	anInteger timesRepeat: [ blocks add: blocks last parent ].
	^ blocks