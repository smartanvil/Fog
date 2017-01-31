as yet unclassified
register: aDuration
	timeLeft := self timeLeft - aDuration.
	timeLeft asSeconds <= 0
		ifTrue: [ future
				deployFailure:
					(Error new
						messageText: 'Transaction not finished';
						yourself) ]