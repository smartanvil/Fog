"
This test case just hold some magic numbers. 
"
Class {
	#name : #FogArbitraryAddressesTestCase,
	#superclass : #FogTestCase,
	#classVars : [
		'testingContract'
	],
	#category : 'FogLiveTests'
}

{ #category : #accessing }
FogArbitraryAddressesTestCase >> code [
	^ '
	pragma solidity ^0.4.2;

contract SimpleStorage {
    address     _owner;
    uint256 storedData;
    bool test2;
    bool test3;
    bool test4;
    
    function SimpleStorage (){
        _owner = msg.sender;
	test2 = true;
	storedData = 3;
    }
    function kill() {
        suicide(_owner);
    }
    
    function getAddr() constant returns (address retVal) {
        return _owner;
    }
    function getBool() constant returns (bool retVal) {
        return test2;
    }
    function test() {
        test2 =   _owner == msg.sender;
    }
    function set(uint256 x) {
        storedData = x;
    }
    function get() constant returns (uint256 retVal) {
        return storedData;
    }
    
    
}
	'
]

{ #category : #'as yet unclassified' }
FogArbitraryAddressesTestCase >> createContract [
	| description |
	description := self createContractDescription.
	^ (description mirror constructor
		using: session
		applyOn: description
		valueWithArguments: {}
		from: self ownerAccount
		gas: 3000000
		gasPrice: 60)
		waitIsReady;
		yourself
]

{ #category : #'as yet unclassified' }
FogArbitraryAddressesTestCase >> createContractDescription [
	| file code |
	file := 'test/test-contract.sol' asFileReference.
	file parent exists
		ifFalse: [ file ensureCreateDirectory ].
	file exists
		ifTrue: [ file delete ].
	code := String lf join: self code lines.
	file writeStream
		nextPutAll: code;
		flush;
		close.
	^ (session loadPackageForFileReference: file entry asFileReference) descriptions anyOne. 
]

{ #category : #'as yet unclassified' }
FogArbitraryAddressesTestCase >> ownerAccount [
	^ FogExternalAccount new
		address: self ownerAccountAddress ;
		name: 'Miner';
		yourself
]

{ #category : #'as yet unclassified' }
FogArbitraryAddressesTestCase >> ownerAccountAddress [
	^ '0x81bfba8301a073a010e9fb71fab514e53d1cc3f0'"'0xb4ebf466889c4a0239379125a7d0f9c4e8bf2a14'"
	  
]
