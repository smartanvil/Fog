initialization
testRuntimeCodeStreamConstructorRaisesException 
	self should: [ contractDescription mnemonicRuntime readStream nextConstructor   ] raise: Error 