pragma solidity ^0.4.2;

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
    }
   
    function kill() {
        suicide(_owner);
    }
       
    
}
