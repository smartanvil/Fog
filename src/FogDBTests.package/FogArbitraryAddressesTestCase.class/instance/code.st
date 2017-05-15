accessing
code
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