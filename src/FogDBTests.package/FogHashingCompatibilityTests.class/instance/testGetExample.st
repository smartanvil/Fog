tests
testGetExample
	self assert: 'bfdb629c6f75944815d014aa71431ccabcc563dbfb8087573f6551c48c054649' equals: (Keccak hashMessage: 'getExample()') asByteArray hex