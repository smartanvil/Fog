tests
testGetExample3
	self assert: '469b040181a1d6492572dfdc780b053d0c681483cc6eb3ce9c8e9858c92bd274' equals: (Keccak hashMessage: 'getExample3()')asByteArray hex