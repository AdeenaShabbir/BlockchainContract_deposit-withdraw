pragma solidity ^0.6.0;

contract Ownable {
    address payable private _owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    constructor () internal {
        _owner = msg.sender;
        emit OwnershipTransferred(address(0), _owner);
    }

    function owner() public view returns (address payable) {
        return _owner;
    }

    modifier onlyOwner() {
        require(_owner == msg.sender, "Ownable: caller is not the owner");
        _;
    }

   
    function renounceOwnership() public virtual onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }

 
}

contract Transfer is Ownable {
    uint _amount;
    
    function tocontract() external payable onlyOwner{
       _amount += msg.value;
    }
    
     function balanceCheck() external view returns(uint){
        return address(this).balance;
    }
    
    function toaddress() external onlyOwner {
        address payable _owner = owner();
        _owner.transfer(address(this).balance);
    }
    
   
}
