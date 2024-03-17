// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FinancialContract {
    struct Transaction {
        uint256 amount;
        uint256 timestamp;
        bytes32 transactionType;
    }

    struct User {
        uint256 balance;
        Transaction[] transactions;
    }

    mapping(address => User) private users;
    address private owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    function deposit(uint256 amount) external {
        require(amount > 0, "Deposit amount must be greater than zero");
        User storage user = users[msg.sender];
        user.balance += amount;
        user.transactions.push(Transaction(amount, block.timestamp, "Deposit"));
    }

    function withdraw(uint256 amount) external {
        require(amount > 0, "Withdrawal amount must be greater than zero");
        User storage user = users[msg.sender];
        require(user.balance >= amount, "Insufficient balance");
        user.balance -= amount;
        user.transactions.push(Transaction(amount, block.timestamp, "Withdrawal"));
    }

    function getBalance() external view returns (uint256) {
        return users[msg.sender].balance;
    }

    function recordExpense(uint256 amount) external {
        require(amount > 0, "Expense amount must be greater than zero");
        User storage user = users[msg.sender];
        require(user.balance >= amount, "Insufficient balance");
        user.balance -= amount;
        user.transactions.push(Transaction(amount, block.timestamp, "Expense"));
    }

    function recordIncome(uint256 amount) external {
        require(amount > 0, "Income amount must be greater than zero");
        User storage user = users[msg.sender];
        user.balance += amount;
        user.transactions.push(Transaction(amount, block.timestamp, "Income"));
    }

    function recordSavings(uint256 amount) external {
        require(amount > 0, "Savings amount must be greater than zero");
        User storage user = users[msg.sender];
        user.balance += amount;
        user.transactions.push(Transaction(amount, block.timestamp, "Savings"));
    }

    function recordInvestment(uint256 amount) external {
        require(amount > 0, "Investment amount must be greater than zero");
        User storage user = users[msg.sender];
        user.balance += amount;
        user.transactions.push(Transaction(amount, block.timestamp, "Investment"));
    }

    function getUserTransactions(address user) external view onlyOwner returns (Transaction[] memory) {
        return users[user].transactions;
    }

    function getUserBalance(address user) external view onlyOwner returns (uint256) {
        return users[user].balance;
    }
}
