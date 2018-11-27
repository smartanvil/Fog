Class {
	#name : #FogSolidityLayoutBuildingTest,
	#superclass : #FogDeployedOnceContractTest,
	#category : 'FogDBTests'
}

{ #category : #accessing }
FogSolidityLayoutBuildingTest class >> reset [
	contract := nil.
]

{ #category : #accessing }
FogSolidityLayoutBuildingTest >> code [
	^ 'pragma solidity ^0.4.2;

contract StructTestContract {

    enum myenum { A, B, C }

    struct  mystruct {
        bool    boolean;
        myenum  uservalue;
        uint32  commonvalue;
    }
    address     _owner;
    bool bool1;
    int16 midint;
    mystruct simpleExample;
    bool bool2;
    mystruct[] arrayExample;
    mapping(uint=>mystruct) mappingExample;

    function StructTestContract (){
        _owner = msg.sender;
	bool1 = true;
	bool2 = true;
	midint = 32;
	simpleExample.boolean = true; 
	simpleExample.uservalue = myenum.B;
	simpleExample.commonvalue = 6355432;
	arrayExample.push(mystruct(true, myenum.A, 134));
	arrayExample.push(mystruct(false, myenum.B, 235 ));
	arrayExample.push(mystruct(true, myenum.C, 34 ));
	mappingExample[1] = mystruct(false, myenum.A, 54 );
	mappingExample[2] = mystruct(true, myenum.C, 34 );
	mappingExample[3] = mystruct(false, myenum.B, 24 );
    }
   
    function kill() {
        suicide(_owner);
    }
       
    
}'
]

{ #category : #values }
FogSolidityLayoutBuildingTest >> testArrayExampleHas3Items [
	| arrayValue |
	arrayValue := (mirror property: #arrayExample)  using: session value: contract at: #latest.
	self assert: arrayValue size equals: 3
]

{ #category : #values }
FogSolidityLayoutBuildingTest >> testArrayExampleHasStructsWithDictionariesContent [
	| arrayValue expected |
	arrayValue := (mirror property: #arrayExample)  using: session value: contract at: #latest.
	expected := {{(#boolean -> true).
	(#uservalue -> 'A').
	(#commonvalue -> 134)} asDictionary .
	{(#boolean -> false).
	(#uservalue -> 'B').
	(#commonvalue -> 235)} asDictionary .
	{(#boolean -> true).
	(#uservalue -> 'C').
	(#commonvalue -> 34)} asDictionary }.
	self assert: arrayValue equals: expected
]

{ #category : #'layout calculations' }
FogSolidityLayoutBuildingTest >> testArrayIsInSlot3AndUsesItfully [
	| map |
	map := (mirror properties at: 6) layout.
	self assert: map fromSlot equals: 3.
	self assert: map toSlot equals: 3.
	self assert: map fromByte equals: 0.
	self assert: map toByte equals: 31
]

{ #category : #'layout calculations' }
FogSolidityLayoutBuildingTest >> testBool1IsInSlot1FromByte0ToByte1 [
	| map |
	map := (mirror properties at: 2) layout.
	self assert: map fromSlot equals: 0.
	self assert: map toSlot equals: 0.
	self assert: map fromByte equals: 20.
	self assert: map toByte equals: 20
]

{ #category : #values }
FogSolidityLayoutBuildingTest >> testBool1IsTrue [
	self assert: ((mirror property: #bool1)  using: session value: contract at: #latest) equals: true
]

{ #category : #'layout calculations' }
FogSolidityLayoutBuildingTest >> testBool2IsInSlot1FromByte3ToByte4 [
	| map |
	map := (mirror properties at: 5) layout.
	self assert: map fromSlot equals: 2.
	self assert: map toSlot equals: 2.
	self assert: map fromByte equals: 0.
	self assert: map toByte equals: 0
]

{ #category : #values }
FogSolidityLayoutBuildingTest >> testBool2IsTrue [
	self assert: ((mirror property: #bool2)  using: session value: contract at: #latest) equals: true
]

{ #category : #values }
FogSolidityLayoutBuildingTest >> testMappingExampleTest1 [
	| dictionary |
	dictionary := (mirror property: #mappingExample)  using: session value: contract at: #latest.
	self
		assert: (dictionary at: 2)
		equals:
			{(#boolean -> true).
			(#uservalue -> 'C').
			(#commonvalue -> 34)} asDictionary
]

{ #category : #values }
FogSolidityLayoutBuildingTest >> testMidintIs32 [
	self assert: ((mirror property: #midint)  using: session value: contract at: #latest ) equals: 32
]

{ #category : #'layout calculations' }
FogSolidityLayoutBuildingTest >> testMidintIsInSlot1FromByte1ToByte3 [
	| map |
	map := (mirror properties at: 3) layout.
	self assert: map fromSlot equals: 0.
	self assert: map toSlot equals: 0.
	self assert: map fromByte equals: 21.
	self assert: map toByte equals: 22
]

{ #category : #'layout calculations' }
FogSolidityLayoutBuildingTest >> testOwnerIsInSlot0FromByte0ToByte19 [
	| map |
	map := (mirror properties at: 1) layout.
	self assert: map fromSlot equals: 0.
	self assert: map toSlot equals: 0.
	self assert: map fromByte equals: 0.
	self assert: map toByte equals: 19
]

{ #category : #values }
FogSolidityLayoutBuildingTest >> testOwnerIsTheGivenAccount [
	self assert: ((mirror property: #_owner) using: session value: contract at: #latest) equals: self ownerAccountAddress
]

{ #category : #'layout calculations' }
FogSolidityLayoutBuildingTest >> testSimpleExampleIsInSlot2And3FromByte0ToByte [
	| map |
	map := (mirror properties at: 4) layout.
	self assert: map fromSlot equals: 1.
	self assert: map toSlot equals: 1.
	self assert: map fromByte equals: 0.
	self assert: map toByte equals: 5
]

{ #category : #values }
FogSolidityLayoutBuildingTest >> testSimpleExampleIsWellSetUp [
	| struct |
	"	simpleExample.boolean = true; 
	simpleExample.uservalue = myenum.B;
	simpleExample.commonvalue = 6355432;"
	struct := (mirror property: #simpleExample) using: session value: contract at: #latest.
	self assert: (struct at: #boolean) equals: true.
	self assert: (struct at: #uservalue) equals: 'B'.
	self assert: (struct at: #commonvalue) equals: 6355432
]
