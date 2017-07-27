accessing
code
	^ 'pragma solidity ^0.4.2;

contract ArrayContract {
    address  _owner;
    uint256[] array;

    function ArrayContract (){
        _owner = msg.sender;
    array.push(1);
    array.push(2);
    array.push(3);
    }
}'