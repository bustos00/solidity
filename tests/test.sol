pragma solidity 0.8.7;

contract test {

    struct wallet {
        uint balance;
        uint numPayments;
    }
    mapping(address => wallet) wallets;

    function getTotalBalance() public view returns(uint) {
        return address(this).balance;
    }

    function getBalance() public view returns(uint) {
        return wallets[msg.sender].balance;
    }

    function withdrawAllMoney(address payable _to) public {
        uint _amount = wallets[msg.sender].balance;
        wallets[msg.sender].balance = 0;
        _to.transfer(_amount);
    }

    receive() external payable {
        wallets[msg.sender].balance += msg.value;
        wallets[msg.sender].numPayments += 1;
    }
}
