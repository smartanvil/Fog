accessing
code
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