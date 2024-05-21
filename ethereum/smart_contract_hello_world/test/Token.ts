import { HardhatEthersSigner } from "@nomicfoundation/hardhat-ethers/signers";
import { ethers } from "hardhat";
import { expect } from "chai";
import { Contract, Signer } from "ethers";

describe("Token contract", function() {
  it("Should tranfer tokens between accounts", async function() {
    const TuTuToken = await ethers.getContractFactory('TuTuToken');
    const tutuToken = await TuTuToken.deploy();
    const [owner, addr1, addr2]:HardhatEthersSigner[] = await ethers.getSigners();

    await tutuToken.transfer(addr1.address, 50);
    expect(await tutuToken.balanceOf(addr1.address)).to.equal(50);

    await tutuToken.transfer(addr2.address, 30);
    expect(await tutuToken.balanceOf(addr2.address)).to.equal(30);
  })


  it("Should assign the total supply of tokens to the owner", async function() {
    const TuTuToken = await ethers.getContractFactory('TuTuToken');
    const tutuToken = await TuTuToken.deploy();
    
    const [owner]:HardhatEthersSigner[]= await ethers.getSigners();

    const ownerBalance = await tutuToken.balanceOf(owner.address);

    expect(100).to.equal(ownerBalance);
  });
});
