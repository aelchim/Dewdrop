pragma solidity ^0.4.18;

import "./ownable.sol";
import "./destructible.sol";
import "./tokenInterfaces.sol";

contract Dewdrop is Ownable, Destructible {

    WednesdayCoin public wednesdayCoin;
    
    function Dewdrop() {
        //for testing 0xEDFc38FEd24F14aca994C47AF95A14a46FBbAA16
        //for main 0x7848ae8f19671dc05966dafbefbbbb0308bdfabd
        wednesdayCoin = WednesdayCoin(0x7848ae8f19671dc05966dafbefbbbb0308bdfabd);
    }

    function multiSend(address[] _to, uint256[] _value) public onlyOwner returns (bool _success) {
        require(_to.length == _value.length);
        require(_to.length <= 150);
        // loop through to addresses and send value
        for (uint256 i = 0; i < _to.length; i++) {
            wednesdayCoin.transfer(_to[i], _value[i]);
        }
        return true;
    }
    
    function multiSendSameValue(address[] _to, uint256 _value) public onlyOwner returns (bool _success) {
        require(_to.length <= 150);
        // loop through to addresses and send value
        for (uint256 i = 0; i < _to.length; i++) {
            wednesdayCoin.transfer(_to[i], _value);
        }
        return true;
    }
}