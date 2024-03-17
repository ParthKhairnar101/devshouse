const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("FinancialContract", function () {
  let FinancialContract;
  let financialContract;
  let owner;
  let addr1;
  let addr2;

  beforeEach(async function () {
    [owner, addr1, addr2] = await ethers.getSigners();
    FinancialContract = await ethers.getContractFactory("FinancialContract");
    financialContract = await FinancialContract.deploy();
    await financialContract.deployed();
  });

  it("Should allow deposit and check balance", async function () {
    await financialContract.deposit(100);
    expect(await financialContract.getBalance()).to.equal(100);
  });

  it("Should allow withdrawal and update balance", async function () {
    await financialContract.deposit(100);
    await financialContract.withdraw(50);
    expect(await financialContract.getBalance()).to.equal(50);
  });

  it("Should allow recording expense and update balance", async function () {
    await financialContract.deposit(100);
    await financialContract.recordExpense(30);
    expect(await financialContract.getBalance()).to.equal(70);
  });

  it("Should allow recording income and update balance", async function () {
    await financialContract.recordIncome(50);
    expect(await financialContract.getBalance()).to.equal(50);
  });

  it("Should allow recording savings and update balance", async function () {
    await financialContract.recordSavings(20);
    expect(await financialContract.getBalance()).to.equal(20);
  });

  it("Should allow recording investment and update balance", async function () {
    await financialContract.recordInvestment(80);
    expect(await financialContract.getBalance()).to.equal(80);
  });

  it("Should return user transactions for owner", async function () {
    await financialContract.deposit(100);
    const userTransactions = await financialContract.getUserTransactions(owner.address);
    expect(userTransactions.length).to.equal(1);
    expect(userTransactions[0].amount).to.equal(100);
  });

  it("Should return user balance for owner", async function () {
    await financialContract.deposit(100);
    const userBalance = await financialContract.getUserBalance(owner.address);
    expect(userBalance).to.equal(100);
  });

  // Add more test cases as needed...

});
