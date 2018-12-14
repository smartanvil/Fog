Class {
	#name : #FogContractMirrorFullUsage,
	#superclass : #FogDeployedOnceContractTest,
	#category : 'FogLiveTests'
}

{ #category : #accessing }
FogContractMirrorFullUsage >> code [
	^ 'pragma solidity ^0.4.2;

contract FullUsage {

   /* Type Definition */
    enum EnumDefinition { POSITIVE , NEGATIVE , NEUTRAL }
    
   /* Properties */
    address owner;
    string str;
    int256 negativeInt;
    int256 positiveInt; 
    EnumDefinition enumEntry;
    int256[] commonArray;
    string str2;
    
     /* Constructor */
   function FullUsage () public { 
        owner = msg.sender;
	negativeInt = -1;
	positiveInt = 255; 
	commonArray.push(1);
	commonArray.push(20);
	str = ''String'';
	enumEntry = EnumDefinition.NEUTRAL;
    }


    function setString ( string memory value) public {
      str = value;
    }
    function getString () view public returns (string memory ret)  {
      ret = str;
    }
    function setTwoStrings(string memory value1, string memory value2 ) public {
      str = value1;
      str2 = value2;
    }
    function setTwoStringsEnumInt( string memory value1, EnumDefinition valEnum, int256 valInt, string memory value2 ) public {
      str = value1;
      str2 = value2;
      enumEntry = valEnum;
      positiveInt = valInt;
    }

    function getExample () view public returns (int256 val, string memory val2, string memory val4, int256 val3, EnumDefinition en) {
	val = positiveInt;
	val2 = str;
	val4 = str;
	val3 = negativeInt;
	en = enumEntry; 
    }
    function getExample2 () view public returns (string memory val2, int256 val, int256 val3, EnumDefinition en, string memory val4) {
	val = positiveInt;
	val2 = str;
	val4 = str;
	val3 = negativeInt;
	en = enumEntry; 
    }
    function getExample3 () view public returns (int256 val, string memory val2, EnumDefinition en, string memory val4, int256 val3) {
	val = positiveInt;
	val2 = str;
	val4 = str;
	val3 = negativeInt;
	en = enumEntry; 
    }
  /* Setting And getting array */
    function setSimpleArray (int256 [] memory value) public {
          commonArray = value;
    }
 
  /* Setting And getting signed int */
    function setNegativeInt(int256 negative) public {
      assert (negative > 0); 
      negativeInt = negative;
    }
    
    function setPositiveInt(int256 positive) public {
      assert (positive < 0) ;
      positiveInt = positive;
    }
    
    function getNegativeInt() view public returns (int256 ret) {
       ret = negativeInt;
    }

    function getPositiveInt() view public returns (int256 ret) {
       ret = positiveInt;
    }

    function getArray () view public returns (int256 [] memory) {
	return commonArray;
    } 
 /* Setting And getting Enum  */
    function setEnum (EnumDefinition value)public  {
        enumEntry = value;
    }
    function getEnum () view public returns (EnumDefinition value) {
        value =  enumEntry ;
    }




    
}

'
]

{ #category : #tests }
FogContractMirrorFullUsage >> testAllGettersWork [
	mirror methods
		select: [ :m | m name beginsWith: 'get' ]
		thenDo: [ :m | 
			m
				using: session
				applyOn: contract
				valueWithArguments: {}
				from: self ownerAccount
				gas: 300000
				gasPrice: 60 ]
]

{ #category : #tests }
FogContractMirrorFullUsage >> testGetExample [
	| example str enum int |
	example := (mirror method: #getExample)
		using: session
		applyOn: contract
		valueWithArguments: {}
		from: self ownerAccount
		gas: 300000
		gasPrice: 60.
	str := (mirror method: #getString)
		using: session
		applyOn: contract
		valueWithArguments: {}
		from: self ownerAccount
		gas: 300000
		gasPrice: 60.
	enum := (mirror method: #getEnum)
		using: session
		applyOn: contract
		valueWithArguments: {}
		from: self ownerAccount
		gas: 300000
		gasPrice: 60.
	int := (mirror method: #getPositiveInt)
		using: session
		applyOn: contract
		valueWithArguments: {}
		from: self ownerAccount
		gas: 300000
		gasPrice: 60.
	self
		assert: example
		equals:
			{int.
			str.
			str.
			-1.
			enum} asOrderedCollection
]

{ #category : #tests }
FogContractMirrorFullUsage >> testGetExample2 [
	| example str enum int |
	str := (mirror method: #getString)
		using: session
		applyOn: contract
		valueWithArguments: {}
		from: self ownerAccount
		gas: 300000
		gasPrice: 60.
	example := (mirror method: #getExample2)
		using: session
		applyOn: contract
		valueWithArguments: {}
		from: self ownerAccount
		gas: 300000
		gasPrice: 60.
	enum := (mirror method: #getEnum)
		using: session
		applyOn: contract
		valueWithArguments: {}
		from: self ownerAccount
		gas: 300000
		gasPrice: 60.
	int := (mirror method: #getPositiveInt)
		using: session
		applyOn: contract
		valueWithArguments: {}
		from: self ownerAccount
		gas: 300000
		gasPrice: 60.
	self
		assert: example
		equals:
			{str.
			int.
			-1.
			enum.
			str} asOrderedCollection
]

{ #category : #tests }
FogContractMirrorFullUsage >> testGetExample3 [
	| example str enum int |
	str := (mirror method: #getString)
		using: session
		applyOn: contract
		valueWithArguments: {}
		from: self ownerAccount
		gas: 300000
		gasPrice: 60.
	example := (mirror method: #getExample3)
		using: session
		applyOn: contract
		valueWithArguments: {}
		from: self ownerAccount
		gas: 300000
		gasPrice: 60.
	enum := (mirror method: #getEnum)
		using: session
		applyOn: contract
		valueWithArguments: {}
		from: self ownerAccount
		gas: 300000
		gasPrice: 60.
	int := (mirror method: #getPositiveInt)
		using: session
		applyOn: contract
		valueWithArguments: {}
		from: self ownerAccount
		gas: 300000
		gasPrice: 60.
	self
		assert: example
		equals:
			{int.
			str.
			enum.
			str.
			-1} asOrderedCollection
]

{ #category : #tests }
FogContractMirrorFullUsage >> testSetGetArrayInt [
	| future example |
	future := (mirror method: #setSimpleArray:)
		using: session
		applyOn: contract
		valueWithArguments: {{1 . 2 . 3 . 4 . 6}}
		from: self ownerAccount
		gas: 300000
		gasPrice: 60.
	future synchronizeTimeout: 10 minutes.
	example := (mirror method: #getArray)
		using: session
		applyOn: contract
		valueWithArguments: {}
		from: self ownerAccount
		gas: 300000
		gasPrice: 60.
	self assert: example equals: {1 . 2 . 3 . 4 . 6}.
	self assert: ((mirror property: #commonArray) using: session value: contract at: #latest) equals: {1 . 2 . 3 . 4 . 6}
]

{ #category : #tests }
FogContractMirrorFullUsage >> testSetLong128String [
	| future setString |
	setString := mirror method: #setString:.
	future := setString
		using: session
		applyOn: contract
		valueWithArguments: {('AStringOf128Characters' padRightTo: 128 with: $#)}
		from: self ownerAccount
		gas: 300000
		gasPrice: 60.
	future synchronizeTimeout: 10 minutes.
	self
		assert:
			((mirror method: #getString)
				using: session
				applyOn: contract
				valueWithArguments: {}
				from: self ownerAccount
				gas: 300000
				gasPrice: 60)
		equals: ('AStringOf128Characters' padRightTo: 128 with: $#)
]

{ #category : #tests }
FogContractMirrorFullUsage >> testSetLong130String [
	| future setString |
	setString := mirror method: #setString:.
	future := setString
		using: session
		applyOn: contract
		valueWithArguments: {('AStringOf130Characters' padRightTo: 130 with: $#)}
		from: self ownerAccount
		gas: 300000
		gasPrice: 60.
	future synchronizeTimeout: 10 minutes.
	self
		assert:
			((mirror method: #getString)
				using: session
				applyOn: contract
				valueWithArguments: {}
				from: self ownerAccount
				gas: 300000
				gasPrice: 60)
		equals: ('AStringOf130Characters' padRightTo: 130 with: $#)
]

{ #category : #tests }
FogContractMirrorFullUsage >> testSetLong256String [
	| future setString |
	setString := mirror method: #setString:.
	future := setString
		using: session
		applyOn: contract
		valueWithArguments: {('AStringOf256Characters' padRightTo: 256 with: $#)}
		from: self ownerAccount
		gas: 300000
		gasPrice: 60.
	future synchronizeTimeout: 10 minutes.
	self
		assert:
			((mirror method: #getString)
				using: session
				applyOn: contract
				valueWithArguments: {}
				from: self ownerAccount
				gas: 300000
				gasPrice: 60)
		equals: ('AStringOf256Characters' padRightTo: 256 with: $#)
]

{ #category : #tests }
FogContractMirrorFullUsage >> testSetLong260String [
	| future setString |
	setString := mirror method: #setString:.
	future := setString
		using: session
		applyOn: contract
		valueWithArguments: {('AStringOf260Characters' padRightTo: 260 with: $#)}
		from: self ownerAccount
		gas: 300000
		gasPrice: 60.
	future synchronizeTimeout: 10 minutes.
	self
		assert:
			((mirror method: #getString)
				using: session
				applyOn: contract
				valueWithArguments: {}
				from: self ownerAccount
				gas: 300000
				gasPrice: 60)
		equals: ('AStringOf260Characters' padRightTo: 260 with: $#)
]

{ #category : #tests }
FogContractMirrorFullUsage >> testSetLong64String [
	| future setString |
	setString := mirror method: #setString:.
	future := setString
		using: session
		applyOn: contract
		valueWithArguments: {('AStringOf64Characters' padRightTo: 64 with: $-)}
		from: self ownerAccount
		gas: 300000
		gasPrice: 60.
	future synchronizeTimeout: 10 minutes.
	self
		assert:
			((mirror method: #getString)
				using: session
				applyOn: contract
				valueWithArguments: {}
				from: self ownerAccount
				gas: 300000
				gasPrice: 60)
		equals: ('AStringOf64Characters' padRightTo: 64 with: $-)
]

{ #category : #tests }
FogContractMirrorFullUsage >> testSetLong70String [
	| future setString |
	setString := mirror method: #setString:.
	future := setString
		using: session
		applyOn: contract
		valueWithArguments: {('AStringOf70Characters' padRightTo: 70 with: $-)}
		from: self ownerAccount
		gas: 300000
		gasPrice: 60.
	future synchronizeTimeout: 10 minutes.
	self
		assert:
			((mirror method: #getString)
				using: session
				applyOn: contract
				valueWithArguments: {}
				from: self ownerAccount
				gas: 300000
				gasPrice: 60)
		equals: ('AStringOf70Characters' padRightTo: 70 with: $-)
]

{ #category : #tests }
FogContractMirrorFullUsage >> testSetString [
	| future setString |
	setString := mirror method: #setString:.
	future := setString
		using: session
		applyOn: contract
		valueWithArguments: {'Hithere'}
		from: self ownerAccount
		gas: 300000
		gasPrice: 60.
	future synchronizeTimeout: 10 minutes.
	self
		assert:
			((mirror method: #getString)
				using: session
				applyOn: contract
				valueWithArguments: {}
				from: self ownerAccount
				gas: 300000
				gasPrice: 60)
		equals: 'Hithere'
]

{ #category : #tests }
FogContractMirrorFullUsage >> testSetTwoString [
	| future setString |
	setString := mirror method: #setTwoStrings:and:.
	future := setString
		using: session
		applyOn: contract
		valueWithArguments: {'Heeeey!' . 'Yeahytutuou'}
		from: self ownerAccount
		gas: 300000
		gasPrice: 60.
	future synchronizeTimeout: 10 minutes.
	self
		assert:
			((mirror method: #getString)
				using: session
				applyOn: contract
				valueWithArguments: {}
				from: self ownerAccount
				gas: 300000
				gasPrice: 60)
		equals: 'Heeeey!'
]

{ #category : #tests }
FogContractMirrorFullUsage >> testSetTwoStringEnumInt [
	| future setString |
	"string value1, EnumDefinition valEnum, int256 valInt, string value2 "
	setString := mirror method: #setTwoStringsEnumInt:and:and:and:.
	future := setString
		using: session
		applyOn: contract
		valueWithArguments: {'HeyTwoStrings!' . #NEUTRAL . 123 . 'Yeahyou'}
		from: self ownerAccount
		gas: 300000
		gasPrice: 60.
	future synchronizeTimeout: 10 minutes.
	self
		assert:
			((mirror method: #getString)
				using: session
				applyOn: contract
				valueWithArguments: {}
				from: self ownerAccount
				gas: 300000
				gasPrice: 60)
		equals: 'HeyTwoStrings!'.
	self
		assert:
			((mirror method: #getEnum)
				using: session
				applyOn: contract
				valueWithArguments: {}
				from: self ownerAccount
				gas: 300000
				gasPrice: 60)
		equals: #NEUTRAL.
	self
		assert:
			((mirror method: #getPositiveInt)
				using: session
				applyOn: contract
				valueWithArguments: {}
				from: self ownerAccount
				gas: 300000
				gasPrice: 60)
		equals: 123
]
