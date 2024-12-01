function withdraw() public onlyOwner nonReentrant {
    uint256 balance = address(this).balance;
    require(balance > 0, "No funds to withdraw");

    donations[msg.sender] = 0; // Effects
    emit FundsWithdrawn(msg.sender, balance);

    (bool success, ) = owner.call{value: balance}(""); // Interactions
    require(success, "Withdrawal failed");
}
