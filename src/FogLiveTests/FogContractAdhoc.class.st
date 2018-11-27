Class {
	#name : #FogContractAdhoc,
	#superclass : #FogDeployedOnceContractTest,
	#category : 'FogDBTests'
}

{ #category : #accessing }
FogContractAdhoc class >> reset [
	contract := nil
]

{ #category : #accessing }
FogContractAdhoc >> code [
	^ 'pragma solidity ^0.4.2;

contract ArrayContract {
    address  _owner;
    uint256[] array;
    mapping(uint => uint256[]) [] arrayOfMaps;
    mapping(uint => uint256[]) mappingArrayValue;
    mapping( uint => mapping(uint => uint256[])) mappingIntMappint;

    function ArrayContract (){
        _owner = msg.sender;
    array.push(1);
    array.push(2);
    array.push(3);
    }
}'
]

{ #category : #accessing }
FogContractAdhoc >> testArrayOfMapsProperty [
	self assert: ((mirror property: #arrayOfMaps) using: session value: contract  at: #latest) size equals: 0
]

{ #category : #accessing }
FogContractAdhoc >> testArrayProperty [
	self assert: ((mirror property: #array)  using: session value: contract  at: #latest) equals: {1 . 2 . 3}
]
